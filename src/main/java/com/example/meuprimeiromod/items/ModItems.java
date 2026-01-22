package com.example.meuprimeiromod.items;

import com.example.meuprimeiromod.MeuPrimeiroModMinecraft;
import com.example.meuprimeiromod.creativetab.ModCreativeTabs;
import net.minecraft.world.item.Item;
import net.minecraftforge.eventbus.api.IEventBus;
import net.minecraftforge.registries.DeferredRegister;
import net.minecraftforge.registries.ForgeRegistries;
import net.minecraftforge.registries.RegistryObject;

public class ModItems {
    public static final DeferredRegister<Item> ITEMS =
            DeferredRegister.create(ForgeRegistries.ITEMS, MeuPrimeiroModMinecraft.MOD_ID);

    // Exemplo de item simples
    public static final RegistryObject<Item> MEU_PRIMEIRO_ITEM = ITEMS.register("meu_primeiro_item",
            () -> new MeuPrimeiroItem(new Item.Properties()
                    .stacksTo(64)
                    .tab(ModCreativeTabs.MEU_PRIMEIRO_MOD_TAB.get())));

    public static void register(IEventBus eventBus) {
        ITEMS.register(eventBus);
    }
}
