import 'dart:convert';

import 'package:http/http.dart' as http;

import 'exception_classes.dart';

/// API error with status codes

dynamic processResponse(
  http.Response response,
  String url,
) {
  switch (response.statusCode) {
    case 200:
      var responseJson = response.body;
      return responseJson;

    /// Multiple Choices
    /// The requested resource corresponds to any one of a set
    /// of representations, each with its own specific location.
    case 300:
      throw MultipleChoicesException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// Moved permanently
    /// The resource has moved permanently. Please refer to the documentation.
    case 301:
      throw MovedPermanentlyException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// Found exception
    /// The resource has moved permanently. Please refer to the documentation.
    case 302:
      throw FoundException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// See other
    /// The resource has moved permanently. Please refer to the documentation.
    case 303:
      throw SeeOtherException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// Not modified
    /// The resource is available and not modified.
    case 304:
      throw NotModifiedException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// Use proxy
    /// The requested resource must be accessed through the proxy
    /// given by the Location field.
    case 305:
      throw UseProxyException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// Temporary redirect
    /// The resource resides temporarily under a different URI.
    case 307:
      throw TemporaryRedirectException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// Bad Request
    /// Invalid syntax for this request was provided.
    case 400:
      throw BadRequestException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// Unauthorized
    /// You are unauthorized to access the requested resource. Please log in.
    case 401:
      throw UnAuthorizedException(
        jsonDecode(response.body)['msg'],
        url,
      );

    /// Forbidden
    /// Your account is not authorized to access the requested resource.
    case 403:
      throw UnAuthorizedException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// Resource not found
    /// We could not find the resource you requested.
    /// Please refer to the documentation for the list of resources.
    case 404:
      throw NotFoundException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// Method not allowed
    /// This method type is not currently supported.
    case 405:
      throw MethodNotAllowedException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// Not acceptable
    /// Acceptance header is invalid for this endpoint resource.
    case 406:
      throw NotAcceptableException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// Proxy authentication required
    /// Authentication with proxy is required.
    case 407:
      throw ProxyAuthenticationRequiredException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// Request timed out
    /// Client did not produce a request within the time that the server
    /// was prepared to wait.
    case 408:
      throw RequestTimeOutException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// Conflict
    /// The request could not be completed due to a
    /// conflict with the current state of the resource.
    case 409:
      throw ConflictException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// Gone exception
    /// The requested resource is no longer available and has been
    /// permanently removed.
    case 410:
      throw GoneException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// Length required
    /// Length of the content is required, please include it with the request.
    case 411:
      throw LengthRequiredException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// Pre condition failed
    /// The request did not match the pre-conditions of the requested resource.
    case 412:
      throw PreConditionFailedException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// Request entity too large
    /// The request entity is larger than the server is willing
    /// or able to process.
    case 413:
      throw RequestEntityTooLargeException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// Request uri too long
    /// The request URI is longer than the server is willing to interpret.
    case 414:
      throw RequestUriTooLongException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// Unsupported media type
    /// The requested resource does not support the media type provided.
    case 415:
      throw UnsupportedMediaTypeException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// Request range not satisfiable
    /// The requested range for the resource is not available.
    case 416:
      throw RequestedRangeNotSatisfiableException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// Exception failed
    /// Unable to meet the expectation given in the Expect request header.
    case 417:
      throw FailedException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// Missing arguments
    /// The requested resource is missing required arguments.
    case 419:
      throw MissingArgumentsException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// Invalid  arguments
    /// The requested resource does not support one or
    /// more of the given parameters.
    case 420:
      throw InvalidArgumentsException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// UnProcessable entity
    /// The request was well-formed but was unable to be followed
    /// due to semantic errors.
    case 422:
      throw UnProcessableEntityException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// Internal Server Error
    /// Unexpected internal server error.
    case 500:
      throw InternalServerException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// Not implemented
    /// The requested resource is recognized but not implemented.
    case 501:
      throw NotImplementedException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// Bad gateway
    /// Invalid response received when acting as a proxy or gateway.
    case 502:
      throw BadGatewayException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// Service unavailable
    /// The server is currently unavailable.
    case 503:
      throw ServiceUnavailableException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// Gateway time out
    /// Did not receive a timely response from upstream server
    /// while acting as a gateway or proxy.
    case 504:
      throw GatewayTimeOutException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// HTTP version not supported
    /// The HTTP protocol version used in the request message is not supported.
    case 505:
      throw HttpVersionNotSupportedException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// Initialization failure
    /// A failure occurred during initialization of services.
    /// API will be unavailable.
    case 550:
      throw InitializationFailureException(
        jsonDecode(response.body)['message'],
        url,
      );

    /// default error message
    default:
      throw FetchDataException('Something went wrong! ${response.statusCode}');
  }
}
