<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit51e5bd48f0e6b15f0a3c24cba53564ec
{
    public static $files = array (
        'a0edc8309cc5e1d60e3047b5df6b7052' => __DIR__ . '/..' . '/guzzlehttp/psr7/src/functions_include.php',
        'c964ee0ededf28c96ebd9db5099ef910' => __DIR__ . '/..' . '/guzzlehttp/promises/src/functions_include.php',
        '37a3dc5111fe8f707ab4c132ef1dbc62' => __DIR__ . '/..' . '/guzzlehttp/guzzle/src/functions_include.php',
    );

    public static $prefixLengthsPsr4 = array (
        'P' => 
        array (
            'Psr\\Http\\Message\\' => 17,
            'Psr\\Cache\\' => 10,
        ),
        'G' => 
        array (
            'GuzzleHttp\\Psr7\\' => 16,
            'GuzzleHttp\\Promise\\' => 19,
            'GuzzleHttp\\' => 11,
            'Google\\Auth\\' => 12,
        ),
        'F' => 
        array (
            'Firebase\\JWT\\' => 13,
        ),
        'D' => 
        array (
            'Dotenv\\' => 7,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Psr\\Http\\Message\\' => 
        array (
            0 => __DIR__ . '/..' . '/psr/http-message/src',
        ),
        'Psr\\Cache\\' => 
        array (
            0 => __DIR__ . '/..' . '/psr/cache/src',
        ),
        'GuzzleHttp\\Psr7\\' => 
        array (
            0 => __DIR__ . '/..' . '/guzzlehttp/psr7/src',
        ),
        'GuzzleHttp\\Promise\\' => 
        array (
            0 => __DIR__ . '/..' . '/guzzlehttp/promises/src',
        ),
        'GuzzleHttp\\' => 
        array (
            0 => __DIR__ . '/..' . '/guzzlehttp/guzzle/src',
        ),
        'Google\\Auth\\' => 
        array (
            0 => __DIR__ . '/..' . '/google/auth/src',
        ),
        'Firebase\\JWT\\' => 
        array (
            0 => __DIR__ . '/..' . '/firebase/php-jwt/src',
        ),
        'Dotenv\\' => 
        array (
            0 => __DIR__ . '/..' . '/vlucas/phpdotenv/src',
        ),
    );

    public static $prefixesPsr0 = array (
        'G' => 
        array (
            'Google_Service_' => 
            array (
                0 => __DIR__ . '/..' . '/google/apiclient-services/src',
            ),
        ),
    );

    public static $classMap = array (
        'Google\\Auth\\ApplicationDefaultCredentials' => __DIR__ . '/..' . '/google/auth/src/ApplicationDefaultCredentials.php',
        'Google\\Auth\\CacheTrait' => __DIR__ . '/..' . '/google/auth/src/CacheTrait.php',
        'Google\\Auth\\Cache\\InvalidArgumentException' => __DIR__ . '/..' . '/google/auth/src/Cache/InvalidArgumentException.php',
        'Google\\Auth\\Cache\\Item' => __DIR__ . '/..' . '/google/auth/src/Cache/Item.php',
        'Google\\Auth\\Cache\\MemoryCacheItemPool' => __DIR__ . '/..' . '/google/auth/src/Cache/MemoryCacheItemPool.php',
        'Google\\Auth\\CredentialsLoader' => __DIR__ . '/..' . '/google/auth/src/CredentialsLoader.php',
        'Google\\Auth\\Credentials\\AppIdentityCredentials' => __DIR__ . '/..' . '/google/auth/src/Credentials/AppIdentityCredentials.php',
        'Google\\Auth\\Credentials\\GCECredentials' => __DIR__ . '/..' . '/google/auth/src/Credentials/GCECredentials.php',
        'Google\\Auth\\Credentials\\IAMCredentials' => __DIR__ . '/..' . '/google/auth/src/Credentials/IAMCredentials.php',
        'Google\\Auth\\Credentials\\ServiceAccountCredentials' => __DIR__ . '/..' . '/google/auth/src/Credentials/ServiceAccountCredentials.php',
        'Google\\Auth\\Credentials\\ServiceAccountJwtAccessCredentials' => __DIR__ . '/..' . '/google/auth/src/Credentials/ServiceAccountJwtAccessCredentials.php',
        'Google\\Auth\\Credentials\\UserRefreshCredentials' => __DIR__ . '/..' . '/google/auth/src/Credentials/UserRefreshCredentials.php',
        'Google\\Auth\\FetchAuthTokenCache' => __DIR__ . '/..' . '/google/auth/src/FetchAuthTokenCache.php',
        'Google\\Auth\\FetchAuthTokenInterface' => __DIR__ . '/..' . '/google/auth/src/FetchAuthTokenInterface.php',
        'Google\\Auth\\HttpHandler\\Guzzle5HttpHandler' => __DIR__ . '/..' . '/google/auth/src/HttpHandler/Guzzle5HttpHandler.php',
        'Google\\Auth\\HttpHandler\\Guzzle6HttpHandler' => __DIR__ . '/..' . '/google/auth/src/HttpHandler/Guzzle6HttpHandler.php',
        'Google\\Auth\\HttpHandler\\HttpHandlerFactory' => __DIR__ . '/..' . '/google/auth/src/HttpHandler/HttpHandlerFactory.php',
        'Google\\Auth\\Middleware\\AuthTokenMiddleware' => __DIR__ . '/..' . '/google/auth/src/Middleware/AuthTokenMiddleware.php',
        'Google\\Auth\\Middleware\\ScopedAccessTokenMiddleware' => __DIR__ . '/..' . '/google/auth/src/Middleware/ScopedAccessTokenMiddleware.php',
        'Google\\Auth\\Middleware\\SimpleMiddleware' => __DIR__ . '/..' . '/google/auth/src/Middleware/SimpleMiddleware.php',
        'Google\\Auth\\OAuth2' => __DIR__ . '/..' . '/google/auth/src/OAuth2.php',
        'Google\\Auth\\Subscriber\\AuthTokenSubscriber' => __DIR__ . '/..' . '/google/auth/src/Subscriber/AuthTokenSubscriber.php',
        'Google\\Auth\\Subscriber\\ScopedAccessTokenSubscriber' => __DIR__ . '/..' . '/google/auth/src/Subscriber/ScopedAccessTokenSubscriber.php',
        'Google\\Auth\\Subscriber\\SimpleSubscriber' => __DIR__ . '/..' . '/google/auth/src/Subscriber/SimpleSubscriber.php',
        'Logger' => __DIR__ . '/..' . '/apache/log4php/src/main/php/Logger.php',
        'LoggerAppender' => __DIR__ . '/..' . '/apache/log4php/src/main/php/LoggerAppender.php',
        'LoggerAppenderConsole' => __DIR__ . '/..' . '/apache/log4php/src/main/php/appenders/LoggerAppenderConsole.php',
        'LoggerAppenderDailyFile' => __DIR__ . '/..' . '/apache/log4php/src/main/php/appenders/LoggerAppenderDailyFile.php',
        'LoggerAppenderEcho' => __DIR__ . '/..' . '/apache/log4php/src/main/php/appenders/LoggerAppenderEcho.php',
        'LoggerAppenderFile' => __DIR__ . '/..' . '/apache/log4php/src/main/php/appenders/LoggerAppenderFile.php',
        'LoggerAppenderFirePHP' => __DIR__ . '/..' . '/apache/log4php/src/main/php/appenders/LoggerAppenderFirePHP.php',
        'LoggerAppenderMail' => __DIR__ . '/..' . '/apache/log4php/src/main/php/appenders/LoggerAppenderMail.php',
        'LoggerAppenderMailEvent' => __DIR__ . '/..' . '/apache/log4php/src/main/php/appenders/LoggerAppenderMailEvent.php',
        'LoggerAppenderMongoDB' => __DIR__ . '/..' . '/apache/log4php/src/main/php/appenders/LoggerAppenderMongoDB.php',
        'LoggerAppenderNull' => __DIR__ . '/..' . '/apache/log4php/src/main/php/appenders/LoggerAppenderNull.php',
        'LoggerAppenderPDO' => __DIR__ . '/..' . '/apache/log4php/src/main/php/appenders/LoggerAppenderPDO.php',
        'LoggerAppenderPhp' => __DIR__ . '/..' . '/apache/log4php/src/main/php/appenders/LoggerAppenderPhp.php',
        'LoggerAppenderPool' => __DIR__ . '/..' . '/apache/log4php/src/main/php/LoggerAppenderPool.php',
        'LoggerAppenderRollingFile' => __DIR__ . '/..' . '/apache/log4php/src/main/php/appenders/LoggerAppenderRollingFile.php',
        'LoggerAppenderSocket' => __DIR__ . '/..' . '/apache/log4php/src/main/php/appenders/LoggerAppenderSocket.php',
        'LoggerAppenderSyslog' => __DIR__ . '/..' . '/apache/log4php/src/main/php/appenders/LoggerAppenderSyslog.php',
        'LoggerAutoloader' => __DIR__ . '/..' . '/apache/log4php/src/main/php/LoggerAutoloader.php',
        'LoggerConfigurable' => __DIR__ . '/..' . '/apache/log4php/src/main/php/LoggerConfigurable.php',
        'LoggerConfigurationAdapter' => __DIR__ . '/..' . '/apache/log4php/src/main/php/configurators/LoggerConfigurationAdapter.php',
        'LoggerConfigurationAdapterINI' => __DIR__ . '/..' . '/apache/log4php/src/main/php/configurators/LoggerConfigurationAdapterINI.php',
        'LoggerConfigurationAdapterPHP' => __DIR__ . '/..' . '/apache/log4php/src/main/php/configurators/LoggerConfigurationAdapterPHP.php',
        'LoggerConfigurationAdapterXML' => __DIR__ . '/..' . '/apache/log4php/src/main/php/configurators/LoggerConfigurationAdapterXML.php',
        'LoggerConfigurator' => __DIR__ . '/..' . '/apache/log4php/src/main/php/LoggerConfigurator.php',
        'LoggerConfiguratorDefault' => __DIR__ . '/..' . '/apache/log4php/src/main/php/configurators/LoggerConfiguratorDefault.php',
        'LoggerException' => __DIR__ . '/..' . '/apache/log4php/src/main/php/LoggerException.php',
        'LoggerFilter' => __DIR__ . '/..' . '/apache/log4php/src/main/php/LoggerFilter.php',
        'LoggerFilterDenyAll' => __DIR__ . '/..' . '/apache/log4php/src/main/php/filters/LoggerFilterDenyAll.php',
        'LoggerFilterLevelMatch' => __DIR__ . '/..' . '/apache/log4php/src/main/php/filters/LoggerFilterLevelMatch.php',
        'LoggerFilterLevelRange' => __DIR__ . '/..' . '/apache/log4php/src/main/php/filters/LoggerFilterLevelRange.php',
        'LoggerFilterStringMatch' => __DIR__ . '/..' . '/apache/log4php/src/main/php/filters/LoggerFilterStringMatch.php',
        'LoggerFormattingInfo' => __DIR__ . '/..' . '/apache/log4php/src/main/php/helpers/LoggerFormattingInfo.php',
        'LoggerHierarchy' => __DIR__ . '/..' . '/apache/log4php/src/main/php/LoggerHierarchy.php',
        'LoggerLayout' => __DIR__ . '/..' . '/apache/log4php/src/main/php/LoggerLayout.php',
        'LoggerLayoutHtml' => __DIR__ . '/..' . '/apache/log4php/src/main/php/layouts/LoggerLayoutHtml.php',
        'LoggerLayoutPattern' => __DIR__ . '/..' . '/apache/log4php/src/main/php/layouts/LoggerLayoutPattern.php',
        'LoggerLayoutSerialized' => __DIR__ . '/..' . '/apache/log4php/src/main/php/layouts/LoggerLayoutSerialized.php',
        'LoggerLayoutSimple' => __DIR__ . '/..' . '/apache/log4php/src/main/php/layouts/LoggerLayoutSimple.php',
        'LoggerLayoutTTCC' => __DIR__ . '/..' . '/apache/log4php/src/main/php/layouts/LoggerLayoutTTCC.php',
        'LoggerLayoutXml' => __DIR__ . '/..' . '/apache/log4php/src/main/php/layouts/LoggerLayoutXml.php',
        'LoggerLevel' => __DIR__ . '/..' . '/apache/log4php/src/main/php/LoggerLevel.php',
        'LoggerLocationInfo' => __DIR__ . '/..' . '/apache/log4php/src/main/php/LoggerLocationInfo.php',
        'LoggerLoggingEvent' => __DIR__ . '/..' . '/apache/log4php/src/main/php/LoggerLoggingEvent.php',
        'LoggerMDC' => __DIR__ . '/..' . '/apache/log4php/src/main/php/LoggerMDC.php',
        'LoggerNDC' => __DIR__ . '/..' . '/apache/log4php/src/main/php/LoggerNDC.php',
        'LoggerOptionConverter' => __DIR__ . '/..' . '/apache/log4php/src/main/php/helpers/LoggerOptionConverter.php',
        'LoggerPatternConverter' => __DIR__ . '/..' . '/apache/log4php/src/main/php/pattern/LoggerPatternConverter.php',
        'LoggerPatternConverterClass' => __DIR__ . '/..' . '/apache/log4php/src/main/php/pattern/LoggerPatternConverterClass.php',
        'LoggerPatternConverterCookie' => __DIR__ . '/..' . '/apache/log4php/src/main/php/pattern/LoggerPatternConverterCookie.php',
        'LoggerPatternConverterDate' => __DIR__ . '/..' . '/apache/log4php/src/main/php/pattern/LoggerPatternConverterDate.php',
        'LoggerPatternConverterEnvironment' => __DIR__ . '/..' . '/apache/log4php/src/main/php/pattern/LoggerPatternConverterEnvironment.php',
        'LoggerPatternConverterFile' => __DIR__ . '/..' . '/apache/log4php/src/main/php/pattern/LoggerPatternConverterFile.php',
        'LoggerPatternConverterLevel' => __DIR__ . '/..' . '/apache/log4php/src/main/php/pattern/LoggerPatternConverterLevel.php',
        'LoggerPatternConverterLine' => __DIR__ . '/..' . '/apache/log4php/src/main/php/pattern/LoggerPatternConverterLine.php',
        'LoggerPatternConverterLiteral' => __DIR__ . '/..' . '/apache/log4php/src/main/php/pattern/LoggerPatternConverterLiteral.php',
        'LoggerPatternConverterLocation' => __DIR__ . '/..' . '/apache/log4php/src/main/php/pattern/LoggerPatternConverterLocation.php',
        'LoggerPatternConverterLogger' => __DIR__ . '/..' . '/apache/log4php/src/main/php/pattern/LoggerPatternConverterLogger.php',
        'LoggerPatternConverterMDC' => __DIR__ . '/..' . '/apache/log4php/src/main/php/pattern/LoggerPatternConverterMDC.php',
        'LoggerPatternConverterMessage' => __DIR__ . '/..' . '/apache/log4php/src/main/php/pattern/LoggerPatternConverterMessage.php',
        'LoggerPatternConverterMethod' => __DIR__ . '/..' . '/apache/log4php/src/main/php/pattern/LoggerPatternConverterMethod.php',
        'LoggerPatternConverterNDC' => __DIR__ . '/..' . '/apache/log4php/src/main/php/pattern/LoggerPatternConverterNDC.php',
        'LoggerPatternConverterNewLine' => __DIR__ . '/..' . '/apache/log4php/src/main/php/pattern/LoggerPatternConverterNewLine.php',
        'LoggerPatternConverterProcess' => __DIR__ . '/..' . '/apache/log4php/src/main/php/pattern/LoggerPatternConverterProcess.php',
        'LoggerPatternConverterRelative' => __DIR__ . '/..' . '/apache/log4php/src/main/php/pattern/LoggerPatternConverterRelative.php',
        'LoggerPatternConverterRequest' => __DIR__ . '/..' . '/apache/log4php/src/main/php/pattern/LoggerPatternConverterRequest.php',
        'LoggerPatternConverterServer' => __DIR__ . '/..' . '/apache/log4php/src/main/php/pattern/LoggerPatternConverterServer.php',
        'LoggerPatternConverterSession' => __DIR__ . '/..' . '/apache/log4php/src/main/php/pattern/LoggerPatternConverterSession.php',
        'LoggerPatternConverterSessionID' => __DIR__ . '/..' . '/apache/log4php/src/main/php/pattern/LoggerPatternConverterSessionID.php',
        'LoggerPatternConverterSuperglobal' => __DIR__ . '/..' . '/apache/log4php/src/main/php/pattern/LoggerPatternConverterSuperglobal.php',
        'LoggerPatternConverterThrowable' => __DIR__ . '/..' . '/apache/log4php/src/main/php/pattern/LoggerPatternConverterThrowable.php',
        'LoggerPatternParser' => __DIR__ . '/..' . '/apache/log4php/src/main/php/helpers/LoggerPatternParser.php',
        'LoggerReflectionUtils' => __DIR__ . '/..' . '/apache/log4php/src/main/php/LoggerReflectionUtils.php',
        'LoggerRenderer' => __DIR__ . '/..' . '/apache/log4php/src/main/php/renderers/LoggerRenderer.php',
        'LoggerRendererDefault' => __DIR__ . '/..' . '/apache/log4php/src/main/php/renderers/LoggerRendererDefault.php',
        'LoggerRendererException' => __DIR__ . '/..' . '/apache/log4php/src/main/php/renderers/LoggerRendererException.php',
        'LoggerRendererMap' => __DIR__ . '/..' . '/apache/log4php/src/main/php/renderers/LoggerRendererMap.php',
        'LoggerRoot' => __DIR__ . '/..' . '/apache/log4php/src/main/php/LoggerRoot.php',
        'LoggerThrowableInformation' => __DIR__ . '/..' . '/apache/log4php/src/main/php/LoggerThrowableInformation.php',
        'LoggerUtils' => __DIR__ . '/..' . '/apache/log4php/src/main/php/helpers/LoggerUtils.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit51e5bd48f0e6b15f0a3c24cba53564ec::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit51e5bd48f0e6b15f0a3c24cba53564ec::$prefixDirsPsr4;
            $loader->prefixesPsr0 = ComposerStaticInit51e5bd48f0e6b15f0a3c24cba53564ec::$prefixesPsr0;
            $loader->classMap = ComposerStaticInit51e5bd48f0e6b15f0a3c24cba53564ec::$classMap;

        }, null, ClassLoader::class);
    }
}
