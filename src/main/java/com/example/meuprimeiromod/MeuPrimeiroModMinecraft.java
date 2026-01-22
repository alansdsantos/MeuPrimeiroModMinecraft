package com.example.meuprimeiromod;

import com.example.meuprimeiromod.creativetab.ModCreativeTabs;
import com.example.meuprimeiromod.items.ModItems;
import com.mojang.logging.LogUtils;
import net.minecraftforge.common.MinecraftForge;
import net.minecraftforge.eventbus.api.IEventBus;
import net.minecraftforge.fml.common.Mod;
import net.minecraftforge.fml.javafmlmod.FMLJavaModLoadingContext;
import org.slf4j.Logger;

@Mod(MeuPrimeiroModMinecraft.MOD_ID)
public class MeuPrimeiroModMinecraft {
    public static final String MOD_ID = "meuprimeiromod";
    public static final String MOD_NAME = "Meu Primeiro Mod Minecraft";
    public static final String MOD_VERSION = "1.0.0";
    
    private static final Logger LOGGER = LogUtils.getLogger();

    public MeuPrimeiroModMinecraft() {
        IEventBus modEventBus = FMLJavaModLoadingContext.get().getModEventBus();

        // Registrar Creative Tabs
        ModCreativeTabs.register(modEventBus);
        
        // Registrar itens
        ModItems.register(modEventBus);

        // Registrar eventos
        MinecraftForge.EVENT_BUS.register(this);

        LOGGER.info("{} v{} carregado com sucesso!", MOD_NAME, MOD_VERSION);
    }
}
