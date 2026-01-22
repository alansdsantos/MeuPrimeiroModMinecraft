package com.example.meuprimeiromod.creativetab;

import com.example.meuprimeiromod.MeuPrimeiroModMinecraft;
import com.example.meuprimeiromod.items.ModItems;
import net.minecraft.core.registries.Registries;
import net.minecraft.network.chat.Component;
import net.minecraft.world.item.CreativeModeTab;
import net.minecraft.world.item.ItemStack;
import net.minecraftforge.eventbus.api.IEventBus;
import net.minecraftforge.registries.DeferredRegister;
import net.minecraftforge.registries.RegistryObject;

public class ModCreativeTabs {
    public static final DeferredRegister<CreativeModeTab> CREATIVE_MODE_TABS =
            DeferredRegister.create(Registries.CREATIVE_MODE_TAB, MeuPrimeiroModMinecraft.MOD_ID);

    public static final RegistryObject<CreativeModeTab> MEU_PRIMEIRO_MOD_TAB = CREATIVE_MODE_TABS.register("meu_primeiro_mod_tab",
            () -> CreativeModeTab.builder()
                    .icon(() -> new ItemStack(ModItems.MEU_PRIMEIRO_ITEM.get()))
                    .title(Component.translatable("creativetab.meuprimeiromod.meu_primeiro_mod_tab"))
                    .displayItems((parameters, output) -> {
                        // Adicionar itens do mod aqui
                        output.accept(ModItems.MEU_PRIMEIRO_ITEM.get());
                    })
                    .build());

    public static void register(IEventBus eventBus) {
        CREATIVE_MODE_TABS.register(eventBus);
    }
}
