package com.example.meuprimeiromod.items;

import net.minecraft.world.item.Item;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.item.Rarity;

public class MeuPrimeiroItem extends Item {
    public MeuPrimeiroItem(Properties properties) {
        super(properties
                .rarity(Rarity.COMMON)
        );
    }

    @Override
    public boolean isFoil(ItemStack stack) {
        return false;
    }
}
