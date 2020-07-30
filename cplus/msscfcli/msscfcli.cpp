// Description: C++18 Implementation of MSS Code Factory command

/*
 *  MSS Code Factory MssCF 2.13 CLI
 *
 *	Copyright 2020 Mark Stephen Sobkow
 *
 *	This file is part of MSS Code Factory.
 *
 *	MSS Code Factory is free software: you can redistribute it and/or modify
 *	it under the terms of the GNU General Public License as published by
 *	the Free Software Foundation, either version 3 of the License, or
 *	(at your option) any later version.
 *
 *	MSS Code Factory is distributed in the hope that it will be useful,
 *	but WITHOUT ANY WARRANTY; without even the implied warranty of
 *	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *	GNU General Public License for more details.
 *
 *	You should have received a copy of the GNU General Public License
 *	along with MSS Code Factory.  If not, see https://www.gnu.org/licenses/.
 *
 *	Donations to support MSS Code Factory can be made at
 *	https://www.paypal.com/paypalme2/MarkSobkow
 *
 *	Please contact Mark Stephen Sobkow at msobkow@sasktel.net for commercial licensing.
 */

#define DO_EXIT_CLEANUPS 1

#include <cflib/ICFLibPublic.hpp>
#include <cfgenkbram/CFGenKbRamSchema.hpp>
#include <msscf/MssCFPublic.hpp>
#include <cfbam/ICFBamPublic.hpp>
#include <cfbamobj/ICFBamObjPublic.hpp>
#include <cfbamobj/CFBamSchemaObj.hpp>
#include <cfbamsaxloader/CFBamSaxLoaderPublic.hpp>
#include <cfbamram/CFBamRamSchema.hpp>
#include <cfbamcustmsscf/CFBamCustMssCFPublic.hpp>
#include <cfbamcustxmlloader/CFBamCustXmlLoaderPublic.hpp>

using namespace std;

static const std::string CLASS_NAME( "msscfcli" );
static const std::string ProductName( "MSS Code Factory 2.13 C++" );
static const std::string ProductWithVersion( "MSS Code Factory C++ 2.13.11195" );

int main( int argc, char* argv[] ) {

	if( argc < 1 ) {
		std::cerr << CLASS_NAME + " ERROR: Program name is not available\n";
		return( 1 );
	}
	std::string S_ProcName( argv[0] );
	static const std::string S_System( "system" );

	cflib::CFLib::init();
	int retval = 0;
	cflib::CFLibConsoleMessageLog log;
	cfbam::CFBamCustMssCFGelCompiler::setCodeFactoryVersion( ProductName );
	cfbam::ICFBamSchema* cfBamSchema = NULL;
	cfbam::ICFBamSchemaObj* cfBamSchemaObj = NULL;
	cfbam::CFBamCustMssCFEngine* cfEngine = NULL;
	cfcore::ICFGenKbSchema* genKbSchema = NULL;
	cfcore::ICFGenKbSchemaObj* genKbSchemaObj = NULL;
	cflib::ICFLibAnyObj* version = NULL;
	cfbam::ICFBamTenantObj* loadedTenant = NULL;
	cfcore::CFGenKbAuthorization* genKbAuth = NULL;
	cfsec::CFSecAuthorization* cfBamAuth = NULL;

	try {
		log.message( "Starting " + ProductWithVersion + "..." );

		if( argc < 4 ) {
			log.message( "ERROR: Must specify build string, model name, and cartridge name as arguments, potentially followed by optional tool set names" );
			return( 1 );
		}

		std::string generatingBuild( argv[1] );
		std::string modelName( argv[2] );
		std::string cartridgeName( argv[3] );

		std::vector<std::string> toolsetNames;

		for( int i = 4; i < argc; i++ ) {
			std::string aname( argv[i] );
			toolsetNames.push_back( aname );
		}

		cfbam::CFBamCustMssCFPrefs userPrefs;
		if( ! userPrefs.loadPreferences( &log ) ) {
			log.message( "Cannot continue." );
			return( 1 );
		}

		const std::string& prefsGenDir = userPrefs.getRootGenDir( &log );
		size_t idxLast = prefsGenDir.length();
		if( idxLast <= 0 ) {
			log.message( "Preferences RootGenDir is empty" );
			return( 1 );
		}

		std::string rootGenDir( prefsGenDir );
		if( idxLast != prefsGenDir.find_last_of( '/', idxLast ) ) {
			rootGenDir.append( "/" );
		}

		log.message( ProductWithVersion + " started" );

		genKbSchema = new cfcore::CFGenKbRamSchema();
		genKbSchemaObj = new cfcore::CFGenKbSchemaObj();
		genKbSchemaObj->setBackingStore( genKbSchema );
		genKbSchema->connect( S_System, S_System, S_System, S_System );
		genKbSchema->rollback();
		genKbSchema->beginTransaction();
		genKbSchemaObj->setSecCluster( genKbSchemaObj->getClusterTableObj()->getSystemCluster() );
		genKbSchemaObj->setSecTenant( genKbSchemaObj->getTenantTableObj()->getSystemTenant() );
		genKbSchemaObj->setSecSession( genKbSchemaObj->getSecSessionTableObj()->getSystemSession() );
		genKbAuth = new cfcore::CFGenKbAuthorization();
		genKbAuth->setSecCluster( *(genKbSchemaObj->getSecCluster()) );
		genKbAuth->setSecTenant( *(genKbSchemaObj->getSecTenant()) );
		genKbAuth->setSecSession( genKbSchemaObj->getSecSession() );
		genKbSchemaObj->setAuthorization( genKbAuth );

		cfBamSchema = new cfbam::CFBamRamSchema();
		cfBamSchemaObj = new cfbam::CFBamSchemaObj();
		cfBamSchemaObj->setBackingStore( cfBamSchema );
		cfBamSchema->connect( S_System, S_System, S_System, S_System );
		cfBamSchema->rollback();
		cfBamSchema->beginTransaction();
		cfBamSchemaObj->setSecCluster( cfBamSchemaObj->getClusterTableObj()->getSystemCluster() );
		cfBamSchemaObj->setSecTenant( cfBamSchemaObj->getTenantTableObj()->getSystemTenant() );
		cfBamSchemaObj->setSecSession( cfBamSchemaObj->getSecSessionTableObj()->getSystemSession() );
		cfBamAuth = new cfsec::CFSecAuthorization();
		cfBamAuth->setSecCluster( *(cfBamSchemaObj->getSecCluster()) );
		cfBamAuth->setSecTenant( *(cfBamSchemaObj->getSecTenant()) );
		cfBamAuth->setSecSession( cfBamSchemaObj->getSecSession() );
		cfBamSchemaObj->setAuthorization( cfBamAuth );

		cfEngine = new cfbam::CFBamCustMssCFEngine();
		cfEngine->setLog( &log );
		cfEngine->init( generatingBuild, genKbSchemaObj, genKbSchemaObj->getSecTenant(), cfBamSchemaObj, rootGenDir );

		std::vector<std::string> cartridgePath = userPrefs.getCartridgePath();
		for( auto iterCartridgePath = cartridgePath.begin(); iterCartridgePath != cartridgePath.end(); iterCartridgePath ++ ) {
			cfcore::MssCFRuleCartridgeParser::addCartridgePath( *iterCartridgePath );
		}

		std::vector<std::string> modelPath = userPrefs.getModelPath();
		for( auto iterModelPath = modelPath.begin(); iterModelPath != modelPath.end(); iterModelPath ++ ) {
			cfbam::CFBamCustXmlLoader::addModelPath( *iterModelPath );
		}

		cfcore::MssCFRuleCartridgeParser cartridgeParser( cfEngine, &log );
		cartridgeParser.loadRuleCartridge( cartridgeName );

		std::vector<std::string> parsedToolSetNames = cfcore::MssCFRuleCartridgeParser::getToolSetNames();
		if( ! parsedToolSetNames.empty() ) {
			std::string msg( "Rule cartridge specified tool set names " );
			for( auto iterParsedToolSetNames = parsedToolSetNames.begin(); iterParsedToolSetNames != parsedToolSetNames.end(); iterParsedToolSetNames ++ ) {
				if( iterParsedToolSetNames != parsedToolSetNames.begin() ) {
					msg.append( ", " );
				}
				msg.append( *iterParsedToolSetNames );
			}
			log.message( msg );
		}
		else {
			log.message( "Rule cartridge did not define tool set names to process." );
			exit( 1 );
		}

//		Instantiate Bam Model parser

		cfbam::CFBamCustXmlLoader bamParser( cfEngine, &log );
		bamParser.setSchemaObj( cfBamSchemaObj );
		bamParser.setTenant( dynamic_cast<cfbam::ICFBamTenantObj*>( cfBamSchemaObj->getTenantTableObj()->getSystemTenant() ) );

//		Parse the model
	
		bamParser.loadTenant( modelName );

		loadedTenant = bamParser.getTenant();
		version = bamParser.getDefinedProjectVersion();

		if( version != NULL ) {
			if( ! toolsetNames.empty() ) {
				cfEngine->generate( generatingBuild, rootGenDir, version, toolsetNames, cfbam::CFBamCustMssCFEngine::ITEMNAME_TOP );
			}
			else {
				cfEngine->generate( generatingBuild, rootGenDir, version, parsedToolSetNames, cfbam::CFBamCustMssCFEngine::ITEMNAME_TOP );
			}
		}
		else {
			log.message( ProductWithVersion + " has no model to generate" );
		}

		log.message( ProductWithVersion + " finished." );
	}
	catch (xercesc::SAXParseException e) {
		retval = 1;
		const char* cUseMessage = "";
		char* cMessage = NULL;
		const XMLCh* message = e.getMessage();
		if( message != NULL ) {
			cMessage = xercesc::XMLString::transcode( message );
			if( cMessage != NULL ) {
				cUseMessage = cMessage;
			}
		}
		std::string cppMessage( cUseMessage );
		std::cerr << S_ProcName + " SAXParseException: " + cppMessage + "\n";
		if( cMessage != NULL ) {
			xercesc::XMLString::release( &cMessage );
		}
	}
	catch (xercesc::SAXException e) {
		retval = 1;
		const char* cUseMessage = "";
		char* cMessage = NULL;
		const XMLCh* message = e.getMessage();
		if( message != NULL ) {
			cMessage = xercesc::XMLString::transcode( message );
			if( cMessage != NULL ) {
				cUseMessage = cMessage;
			}
		}
		std::string cppMessage( cUseMessage );
		std::cerr << S_ProcName + " SAXException: " + cppMessage + "\n";
		if( cMessage != NULL ) {
			xercesc::XMLString::release( &cMessage );
		}
	}
	catch( cflib::CFLibArgumentOverflowException e ) {
		retval = 1;
		std::cerr << S_ProcName + " CFLibArgumentOverflowException: " + e.what() + "\n";
	}
	catch( cflib::CFLibArgumentRangeException e ) {
		retval = 1;
		std::cerr << S_ProcName + " CFLibArgumentRangeException: " + e.what() + "\n";
	}
	catch( cflib::CFLibArgumentUnderflowException e ) {
		retval = 1;
		std::cerr << S_ProcName + " CFLibArgumentUnderflowException: " + e.what() + "\n";
	}
	catch( cflib::CFLibCollisionDetectedException e ) {
		retval = 1;
		std::cerr << S_ProcName + " CFLibCollisionDetectedException: " + e.what() + "\n";
	}
	catch( cflib::CFLibDbException e ) {
		retval = 1;
		std::cerr << S_ProcName + " CFLibDbException: " + e.what() + "\n";
	}
	catch( cflib::CFLibDependentsDetectedException e ) {
		retval = 1;
		std::cerr << S_ProcName + " CFLibDependentsDetectedException: " + e.what() + "\n";
	}
	catch( cflib::CFLibEmptyArgumentException e ) {
		retval = 1;
		std::cerr << S_ProcName + " CFLibEmptyArgumentException: " + e.what() + "\n";
	}
	catch( cflib::CFLibInvalidArgumentException e ) {
		retval = 1;
		std::cerr << S_ProcName + " CFLibInvalidArgumentException: " + e.what() + "\n";
	}
	catch( cflib::CFLibMathException e ) {
		retval = 1;
		std::cerr << S_ProcName + " CFLibMathException: " + e.what() + "\n";
	}
	catch( cflib::CFLibMustOverrideException e ) {
		retval = 1;
		std::cerr << S_ProcName + " CFLibMustOverrideException: " + e.what() + "\n";
	}
	catch( cflib::CFLibNotImplementedYetException e ) {
		retval = 1;
		std::cerr << S_ProcName + " CFLibNotImplementedYetException: " + e.what() + "\n";
	}
	catch( cflib::CFLibNotSupportedException e ) {
		retval = 1;
		std::cerr << S_ProcName + " CFLibNotSupportedException: " + e.what() + "\n";
	}
	catch( cflib::CFLibNullArgumentException e ) {
		retval = 1;
		std::cerr << S_ProcName + " CFLibNullArgumentException: " + e.what() + "\n";
	}
	catch( cflib::CFLibPrimaryKeyNotNewException e ) {
		retval = 1;
		std::cerr << S_ProcName + " CFLibPrimaryKeyNotNewException: " + e.what() + "\n";
	}
	catch( cflib::CFLibStaleCacheDetectedException e ) {
		retval = 1;
		std::cerr << S_ProcName + " CFLibStaleCacheDetectedException: " + e.what() + "\n";
	}
	catch( cflib::CFLibSubroutineException e ) {
		retval = 1;
		std::cerr << S_ProcName + " CFLibSubroutineException: " + e.what() + "\n";
	}
	catch( cflib::CFLibUniqueIndexViolationException e ) {
		retval = 1;
		std::cerr << S_ProcName + " CFLibUniqueIndexViolationException: " + e.what() + "\n";
	}
	catch( cflib::CFLibUnrecognizedAttributeException e ) {
		retval = 1;
		std::cerr << S_ProcName + " CFLibUnrecognizedAttributeException: " + e.what() + "\n";
	}
	catch( cflib::CFLibUnresolvedRelationException e ) {
		retval = 1;
		std::cerr << S_ProcName + " CFLibUnresolvedRelationException: " + e.what() + "\n";
	}
	catch( cflib::CFLibUnsupportedClassException e ) {
		retval = 1;
		std::cerr << S_ProcName + " CFLibUnsupportedClassException: " + e.what() + "\n";
	}
	catch( cflib::CFLibUsageException e ) {
		retval = 1;
		std::cerr << S_ProcName + " CFLibUsageException: " + e.what() + "\n";
	}
	catch( cflib::CFLibArgumentException e ) {
		retval = 1;
		std::cerr << S_ProcName + " CFLibArgumentException: " + e.what() + "\n";
	}
	catch( cflib::CFLibRuntimeException e ) {
		retval = 1;
		std::cerr << S_ProcName + " CFLibRuntimeException: " + e.what() + "\n";
	}
	catch( std::exception& e ) {
		retval = 1;
		std::cerr << S_ProcName + " std::exception: " + e.what() + "\n";
	}
	catch( std::exception* e ) {
		retval = 1;
		std::cerr << S_ProcName + " std::exception*: " + e->what() + "\n";
	}

#	if DO_EXIT_CLEANUPS

		if( cfBamAuth != NULL ) {
			delete cfBamAuth;
			cfBamAuth = NULL;
		}

		if( ( cfBamSchema != NULL ) && cfBamSchema->isConnected() ) {
			try {
				cfBamSchema->rollback();
			}
			catch ( ... ) {
			}
			try {
				cfBamSchema->disconnect( false );
			}
			catch( ... ) {
			}
		}

		if( cfBamSchemaObj != NULL ) {
			cfBamSchemaObj->setBackingStore( NULL );
			try {
				delete cfBamSchemaObj;
			}
			catch( ... ) {
			}
			cfBamSchemaObj = NULL;
		}

		if( cfBamSchema != NULL ) {
			if( cfBamSchema->isConnected() ) {
				try {
					cfBamSchema->rollback();
				}
				catch ( ... ) {
				}
				try {
					cfBamSchema->disconnect( false );
				}
				catch( ... ) {
				}
			}
			try {
				delete cfBamSchema;
			}
			catch( ... ) {
			}
			cfBamSchema = NULL;
		}

		if( genKbAuth != NULL ) {
			delete genKbAuth;
			genKbAuth = NULL;
		}

		if( ( genKbSchema != NULL ) && genKbSchema->isConnected() ) {
			try {
				genKbSchema->rollback();
			}
			catch ( ... ) {
			}
			try {
				genKbSchema->disconnect( false );
			}
			catch( ... ) {
			}
		}

		if( genKbSchemaObj != NULL ) {
			genKbSchemaObj->setBackingStore( NULL );
			try {
				delete genKbSchemaObj;
			}
			catch( ... ) {
			}
			genKbSchemaObj = NULL;
		}

		if( genKbSchema != NULL ) {
			if( genKbSchema->isConnected() ) {
				try {
					genKbSchema->rollback();
				}
				catch ( ... ) {
				}
				try {
					genKbSchema->disconnect( false );
				}
				catch( ... ) {
				}
			}
			try {
				delete genKbSchema;
			}
			catch( ... ) {
			}
			genKbSchema = NULL;
		}

		if( cfEngine != NULL ) {
			try {
				delete cfEngine;
			}
			catch( ... ) {
			}
			cfEngine = NULL;
		}

		try {
			cflib::CFLib::release();
		}
		catch( ... ) {
		}
#	endif

	return( retval );
}
