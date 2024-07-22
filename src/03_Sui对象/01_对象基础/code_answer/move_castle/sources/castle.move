// castle.move

module move_castle::castle {
    use std::string::{Self, utf8, String};
    
    use move_castle::utils;
    
    /// The castle struct
    public struct Castle has key, store{
        id: UID,
        name: String,
        description: String,
        serial_number: u64,
    }
    
    /// Build a castle.
    entry fun build_castle(size: u64, name_bytes: vector<u8>, desc_bytes: vector<u8>, ctx: &mut TxContext) {

        // castle object UID.
        let obj_id = object::new(ctx);
        
        // generate serial number.
        let serial_number = utils::generate_castle_serial_number(size, &obj_id);
        
        // new castle object.
        let castle = Castle {
            id: obj_id,
            name: string::utf8(name_bytes),
            description: string::utf8(desc_bytes),
            serial_number: serial_number,
        };
        
        // transfer castle object to the owner.
        let owner = tx_context::sender(ctx);
        transfer::public_transfer(castle, owner);
    }
}