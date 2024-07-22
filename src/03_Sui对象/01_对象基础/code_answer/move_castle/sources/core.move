module move_castle::core {
    use sui::object::{Self, UID, ID};
    use std::vector;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct Economy has store {
        treasury: u64,
        base_power: u64,
        settle_time: u64,
        soldier_buff: EconomicBuff,
        battle_buff: vector<EconomicBuff>,
    }

    public struct EconomicBuff has copy, store, drop {
        debuff: bool,
        power: u64,
        start: u64,
        end: u64,
    }

    public struct CastleData has store {
        id: ID,
        size: u64,
        race: u64,
        level: u64,
        experience_pool: u64,
        economy: Economy,
        millitary: Millitary,
    }

    public struct Millitary has store {
        attack_power: u64,
        defense_power: u64,
        total_attack_power: u64,
        total_defense_power: u64,
        soldiers: u64,
        battle_cooldown: u64,
    }

    /// Holding game info
    public struct GameStore has key, store {
        id: UID,
        small_castle_count: u64, // for small castle amount limit
        middle_castle_count: u64, // for middle castle amount limit
        big_castle_count: u64, // for big castle amount limit
        castle_ids: vector<ID>, // holding all castle object ids
    }
    
    /// Capability to modify game settings
    public struct AdminCap has key {
        id: UID
    }

    /// Module initializer create the only one AdminCap and send it to the publisher
    fun init(ctx: &mut TxContext) {
        transfer::transfer(
            AdminCap{id: object::new(ctx)},
            tx_context::sender(ctx)
        );
    }
}