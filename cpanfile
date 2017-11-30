requires 'perl', '5.008001';
requires 'Mouse', 'v2.4.5';
requires 'Data::MessagePack', '0.38';
requires 'parent', '0.221';
requires 'Scalar::Util', '1.14';

# fix local $SIG{__DIE__} + eval problems
requires 'Encode', '2.26';
requires 'Storable', '2.15';

on configure => sub {
    requires 'Module::Build::XSUtil';
    requires 'version', '0.9913';
};

on test => sub {
    requires 'Test::More', '0.88';
    requires 'Test::Requires';
    requires 'File::Copy::Recursive';
    requires 'File::Path', '2.07';
};
