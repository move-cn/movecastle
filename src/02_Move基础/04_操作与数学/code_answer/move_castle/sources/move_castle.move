module move_castle::castle {
    use std::string::{Self, String};

    /// The castle struct
    public struct Castle has key, store{
        id: UID,
        name: String,
        description: String,
        serial_number: u64,
    }
}