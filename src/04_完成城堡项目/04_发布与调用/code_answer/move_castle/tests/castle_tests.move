#[test_only]
module move_castle::castle_tests {
    // uncomment this line to import the module
    // use move_castle::move_castle;

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_move_castle() {
        // pass
    }

    #[test, expected_failure(abort_code = ENotImplemented)]
    fun test_move_castle_fail() {
        abort ENotImplemented
    }
}