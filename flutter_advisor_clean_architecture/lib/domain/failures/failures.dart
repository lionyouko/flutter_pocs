const kServerFailureMessage = 'API error, please try again.';
const kCacheFailureMessage = 'Cache Error, please try again.';
const kGeneralFailureMessage = 'General failure, please try again.';
const kUnknownFailureMessage = 'Failure, please try again.';

//interface
abstract class Failure {}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class GeneralFailure extends Failure {}
