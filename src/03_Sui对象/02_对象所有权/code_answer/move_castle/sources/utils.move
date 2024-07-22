// sources/utils.move

module move_castle::utils {
    use std::vector;
    use sui::hash;

    /// Generating the castle's serial number.
    public(package) fun generate_castle_serial_number(size: u64, id: &UID): u64 {
        // hashing on the castle's UID.
        //let mut hash = hash::sha2_256(object::uid_to_bytes(id));
        //原教程使用hash::sha2_256但以淘汰，更新至keccak256
        let mut hash = hash::keccak256(&object::uid_to_bytes(id));

        let mut result_num: u64 = 0;
        // convert the hash vector to u64.
        while (vector::length(&hash) > 0) {
            let element = vector::remove(&mut hash, 0);
            result_num = ((result_num << 8) | (element as u64));
        };

        // keep the last 5 digits. 
        result_num = result_num % 100000u64;

        // concat the size digit.
        size * 100000u64 + result_num
    }
}