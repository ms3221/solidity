contract Contract {
    function main() {
        memory[0x40:0x60] = 0x80;
    
        if (msg.data.length >= 0x04) {
            var var0 = msg.data[0x00:0x20] >> 0xe0;
        
            if (0x51cff8d9 > var0) {
                if (0x158ef93e > var0) {
                    if (var0 == 0xfdd58e) {
                        // Dispatch table entry for balanceOf(address,uint256)
                        var var1 = msg.value;
                    
                        if (var1) { revert(memory[0x00:0x00]); }
                    
                        var1 = 0x0164;
                        var var2 = 0x015f;
                        var var3 = msg.data.length;
                        var var4 = 0x04;
                        var2, var3 = func_0FEA(var3, var4);
                        var1 = func_015F(var2, var3);
                    
                    label_0164:
                        var temp0 = memory[0x40:0x60];
                        memory[temp0:temp0 + 0x20] = var1;
                        var1 = temp0 + 0x20;
                    
                    label_016E:
                        var temp1 = memory[0x40:0x60];
                        return memory[temp1:temp1 + var1 - temp1];
                    } else if (var0 == 0x01ffc9a7) {
                        // Dispatch table entry for supportsInterface(bytes4)
                        var1 = msg.value;
                    
                        if (var1) { revert(memory[0x00:0x00]); }
                    
                        var1 = 0x0197;
                        var2 = 0x0192;
                        var3 = msg.data.length;
                        var4 = 0x04;
                        var2 = func_1014(var3, var4);
                        var1 = func_0192(var2);
                    
                    label_0197:
                        var temp2 = memory[0x40:0x60];
                        memory[temp2:temp2 + 0x20] = !!var1;
                        var1 = temp2 + 0x20;
                        goto label_016E;
                    } else if (var0 == 0x06fdde03) {
                        // Dispatch table entry for name()
                        var1 = msg.value;
                    
                        if (var1) { revert(memory[0x00:0x00]); }
                    
                        var1 = 0x01bc;
                        var2 = func_0531();
                    
                    label_01BC:
                        var temp3 = var2;
                        var2 = 0x016e;
                        var3 = temp3;
                        var4 = memory[0x40:0x60];
                        var2 = func_1075(var3, var4);
                        goto label_016E;
                    } else if (var0 == 0x0e89341c) {
                        // Dispatch table entry for uri(uint256)
                        var1 = msg.value;
                    
                        if (var1) { revert(memory[0x00:0x00]); }
                    
                        var1 = 0x01bc;
                        var2 = 0x01e4;
                        var3 = msg.data.length;
                        var4 = 0x04;
                        var2 = func_10A8(var3, var4);
                        var1 = func_01E4(var2);
                        goto label_01BC;
                    } else if (var0 == 0x156e29f6) {
                        // Dispatch table entry for mint(address,uint256,uint256)
                        var1 = 0x01fc;
                        var2 = 0x01f7;
                        var3 = msg.data.length;
                        var4 = 0x04;
                        var2, var3, var4 = func_10C1(var3, var4);
                        func_01F7(var2, var3, var4);
                        stop();
                    } else { revert(memory[0x00:0x00]); }
                } else if (var0 == 0x158ef93e) {
                    // Dispatch table entry for initialized()
                    var1 = msg.value;
                
                    if (var1) { revert(memory[0x00:0x00]); }
                
                    var1 = 0x0197;
                    var2 = storage[0x0a] / (0x01 << 0xa0) & 0xff;
                    goto label_0197;
                } else if (var0 == 0x1d126041) {
                    // Dispatch table entry for 0x1d126041 (unknown)
                    var1 = msg.value;
                
                    if (var1) { revert(memory[0x00:0x00]); }
                
                    var1 = 0x0164;
                    var2 = 0x023a;
                    var3 = msg.data.length;
                    var4 = 0x04;
                    var2 = func_10A8(var3, var4);
                    var2 = func_023A(var2);
                    goto label_0164;
                } else if (var0 == 0x2eb2c2d6) {
                    // Dispatch table entry for safeBatchTransferFrom(address,address,uint256[],uint256[],bytes)
                    var1 = msg.value;
                
                    if (var1) { revert(memory[0x00:0x00]); }
                
                    var1 = 0x01fc;
                    var2 = 0x0267;
                    var3 = msg.data.length;
                    var4 = 0x04;
                    var var5 = 0x00;
                    var var6 = var5;
                    var var7 = 0x00;
                    var var8 = var7;
                    var var9 = 0x00;
                
                    if (var3 - var4 i< 0xa0) { revert(memory[0x00:0x00]); }
                
                    var var10 = 0x125b;
                    var var11 = var4;
                    var10 = withdraw(var11);
                    var5 = var10;
                    var10 = 0x1269;
                    var11 = var4 + 0x20;
                    var10 = withdraw(var11);
                    var6 = var10;
                    var10 = msg.data[var4 + 0x40:var4 + 0x40 + 0x20];
                    var11 = 0xffffffffffffffff;
                
                    if (var10 > var11) { revert(memory[0x00:0x00]); }
                
                    var var12 = 0x1292;
                    var var13 = var3;
                    var var14 = var4 + var10;
                    var12 = func_115F(var13, var14);
                    var7 = var12;
                    var10 = msg.data[var4 + 0x60:var4 + 0x60 + 0x20];
                
                    if (var10 > var11) { revert(memory[0x00:0x00]); }
                
                    var12 = 0x12b4;
                    var13 = var3;
                    var14 = var4 + var10;
                    var12 = func_115F(var13, var14);
                    var8 = var12;
                    var10 = msg.data[var4 + 0x80:var4 + 0x80 + 0x20];
                
                    if (var10 > var11) { revert(memory[0x00:0x00]); }
                
                    var11 = 0x12d7;
                    var12 = var3;
                    var13 = var4 + var10;
                    var11 = func_11CA(var12, var13);
                    var temp4 = var6;
                    var6 = var11;
                    var3 = temp4;
                    var temp5 = var5;
                    var5 = var8;
                    var2 = temp5;
                    var4 = var7;
                    // Error: Could not resolve jump destination!
                } else if (var0 == 0x3ccfd60b) {
                    // Dispatch table entry for withdraw()
                    var1 = msg.value;
                
                    if (var1) { revert(memory[0x00:0x00]); }
                
                    var1 = 0x01fc;
                    withdraw();
                    stop();
                } else if (var0 == 0x4cd88b76) {
                    // Dispatch table entry for initialize(string,string)
                    var1 = msg.value;
                
                    if (var1) { revert(memory[0x00:0x00]); }
                
                    var1 = 0x01fc;
                    var2 = 0x029c;
                    var3 = msg.data.length;
                    var4 = 0x04;
                    var2, var3 = func_12E4(var3, var4);
                    var4 = !(storage[0x0a] / (0x01 << 0xa0) & 0xff);
                
                    if (var4) {
                        if (var4) {
                        label_0759:
                            storage[0x0a] = msg.sender | (storage[0x0a] & ~((0x01 << 0xa8) - 0x01)) | (0x01 << 0xa0);
                            var temp6 = var2;
                            var4 = 0x0784;
                            var5 = 0x03;
                            var7 = memory[temp6:temp6 + 0x20];
                            var6 = temp6 + 0x20;
                            var8 = var5;
                            var9 = 0x0f41;
                            var10 = storage[var8];
                            var9 = func_1547(var10);
                            memory[0x00:0x20] = var8;
                            var8 = keccak256(memory[0x00:0x20]);
                            var temp7 = var8 + (var9 + 0x1f) / 0x20;
                            var9 = var6;
                            var6 = temp7;
                        
                            if (!var7) {
                                storage[var5] = 0x00;
                                goto label_0FA9;
                            } else if (0x1f < var7) {
                                var temp8 = var7;
                                storage[var5] = temp8 + temp8 + 0x01;
                            
                                if (!temp8) {
                                label_0FA9:
                                    var temp9 = var6;
                                    var6 = 0x0fb5;
                                    var7 = temp9;
                                    var6 = func_0FB9(var7, var8);
                                    var4 = var5;
                                    // Error: Could not resolve jump destination!
                                } else {
                                    var temp10 = var7;
                                    var temp11 = var9;
                                    var7 = temp11;
                                    var9 = var7 + temp10;
                                
                                    if (var9 <= var7) { goto label_0FA9; }
                                
                                label_0F97:
                                    var temp12 = var7;
                                    var temp13 = var8;
                                    storage[temp13] = memory[temp12:temp12 + 0x20];
                                    var7 = temp12 + 0x20;
                                    var9 = var9;
                                    var8 = temp13 + 0x01;
                                
                                    if (var9 <= var7) { goto label_0FA9; }
                                    else { goto label_0F97; }
                                }
                            } else {
                                var temp14 = var7;
                                storage[var5] = temp14 + temp14 | (memory[var9:var9 + 0x20] & ~0xff);
                                goto label_0FA9;
                            }
                        } else {
                        label_0720:
                            var temp15 = memory[0x40:0x60];
                            memory[temp15:temp15 + 0x20] = 0x461bcd << 0xe5;
                            memory[temp15 + 0x04:temp15 + 0x04 + 0x20] = 0x20;
                            memory[temp15 + 0x24:temp15 + 0x24 + 0x20] = 0x0f;
                            memory[temp15 + 0x44:temp15 + 0x44 + 0x20] = 0x3737ba1034b734ba34b0b634bd32b9 << 0x89;
                            var4 = temp15 + 0x64;
                            var temp16 = memory[0x40:0x60];
                            revert(memory[temp16:temp16 + var4 - temp16]);
                        }
                    } else if (msg.sender == storage[0x0a] & (0x01 << 0xa0) - 0x01) { goto label_0759; }
                    else { goto label_0720; }
                } else if (var0 == 0x4e1273f4) {
                    // Dispatch table entry for balanceOfBatch(address[],uint256[])
                    var1 = msg.value;
                
                    if (var1) { revert(memory[0x00:0x00]); }
                
                    var1 = 0x02c1;
                    var2 = 0x02bc;
                    var3 = msg.data.length;
                    var4 = 0x04;
                    var5 = 0x00;
                    var6 = var5;
                
                    if (var3 - var4 i< 0x40) { revert(memory[0x00:0x00]); }
                
                    var7 = msg.data[var4:var4 + 0x20];
                    var8 = 0xffffffffffffffff;
                
                    if (var7 > var8) { revert(memory[0x00:0x00]); }
                
                    var temp17 = var4 + var7;
                    var7 = temp17;
                
                    if (var7 + 0x1f i>= var3) { revert(memory[0x00:0x00]); }
                
                    var9 = msg.data[var7:var7 + 0x20];
                    var10 = 0x20;
                    var11 = 0x1397;
                    var12 = 0x1180;
                    var13 = var9;
                    var12 = func_113B(var13);
                    var11 = func_1180(var12);
                    var temp18 = var9;
                    var temp19 = var11;
                    memory[temp19:temp19 + 0x20] = temp18;
                    var temp20 = var10;
                    var9 = temp20 + var7 + (temp18 << 0x05);
                    var11 = temp19 + temp20;
                    var12 = temp19;
                
                    if (var9 > var3) { revert(memory[0x00:0x00]); }
                
                    var temp21 = var10 + var7;
                    var12 = var12;
                    var7 = temp21;
                
                    if (var7 >= var9) {
                    label_13DB:
                        var5 = var12;
                        var7 = msg.data[var4 + var10:var4 + var10 + 0x20];
                    
                        if (var7 > var8) { revert(memory[0x00:0x00]); }
                    
                        var8 = 0x133e;
                        var9 = var3;
                        var10 = var4 + var7;
                        var8 = func_115F(var9, var10);
                        var3 = var8;
                        var2 = var5;
                        // Error: Could not resolve jump destination!
                    } else {
                    label_13C4:
                        var13 = 0x13cc;
                        var14 = var7;
                        var13 = withdraw(var14);
                        var temp22 = var11;
                        memory[temp22:temp22 + 0x20] = var13;
                        var temp23 = var10;
                        var7 = temp23 + var7;
                        var11 = temp23 + temp22;
                        var12 = var12;
                    
                        if (var7 >= var9) { goto label_13DB; }
                        else { goto label_13C4; }
                    }
                } else { revert(memory[0x00:0x00]); }
            } else if (0xbd85b039 > var0) {
                if (var0 == 0x51cff8d9) {
                    // Dispatch table entry for withdraw(address)
                    var1 = msg.value;
                
                    if (var1) { revert(memory[0x00:0x00]); }
                
                    var1 = 0x01fc;
                    var2 = 0x02e9;
                    var3 = msg.data.length;
                    var4 = 0x04;
                    var5 = 0x00;
                
                    if (var3 - var4 i< 0x20) { revert(memory[0x00:0x00]); }
                
                    var6 = 0x103e;
                    var7 = var4;
                    var6 = withdraw(var7);
                    var2 = var6;
                    // Error: Could not resolve jump destination!
                } else if (var0 == 0x7874e421) {
                    // Dispatch table entry for 0x7874e421 (unknown)
                    var1 = msg.value;
                
                    if (var1) { revert(memory[0x00:0x00]); }
                
                    var1 = 0x0197;
                    var2 = 0x0309;
                    var3 = msg.data.length;
                    var4 = 0x04;
                    var2 = func_10A8(var3, var4);
                    var2 = func_0309(var2);
                    goto label_0197;
                } else if (var0 == 0x95d89b41) {
                    // Dispatch table entry for symbol()
                    var1 = msg.value;
                
                    if (var1) { revert(memory[0x00:0x00]); }
                
                    var1 = 0x01bc;
                    var2 = symbol();
                    goto label_01BC;
                } else if (var0 == 0xa22cb465) {
                    // Dispatch table entry for setApprovalForAll(address,bool)
                    var1 = msg.value;
                
                    if (var1) { revert(memory[0x00:0x00]); }
                
                    var1 = 0x01fc;
                    var2 = 0x034e;
                    var3 = msg.data.length;
                    var4 = 0x04;
                    var2, var3 = func_1478(var3, var4);
                    var4 = 0x06f4;
                    var5 = msg.sender;
                    var6 = var2;
                    var7 = var3;
                    func_0DB8(var5, var6, var7);
                    // Error: Could not resolve jump destination!
                } else if (var0 == 0xb2bdfa7b) {
                    // Dispatch table entry for _owner()
                    var1 = msg.value;
                
                    if (var1) { revert(memory[0x00:0x00]); }
                
                    var1 = 0x0373;
                    var2 = storage[0x0a] & (0x01 << 0xa0) - 0x01;
                    var temp24 = memory[0x40:0x60];
                    memory[temp24:temp24 + 0x20] = var2 & (0x01 << 0xa0) - 0x01;
                    var2 = temp24 + 0x20;
                    goto label_016E;
                } else { revert(memory[0x00:0x00]); }
            } else if (var0 == 0xbd85b039) {
                // Dispatch table entry for totalSupply(uint256)
                var1 = msg.value;
            
                if (var1) { revert(memory[0x00:0x00]); }
            
                var1 = 0x0164;
                var2 = 0x03a6;
                var3 = msg.data.length;
                var4 = 0x04;
                var2 = func_10A8(var3, var4);
                var1 = func_03A6(var2);
                goto label_0164;
            } else if (var0 == 0xc793803c) {
                // Dispatch table entry for freezeURI()
                var1 = msg.value;
            
                if (var1) { revert(memory[0x00:0x00]); }
            
                var1 = 0x0197;
                var2 = storage[0x06] / 0x0100 & 0xff;
                goto label_0197;
            } else if (var0 == 0xe8a3d485) {
                // Dispatch table entry for contractURI()
                var1 = msg.value;
            
                if (var1) { revert(memory[0x00:0x00]); }
            
                var1 = 0x01bc;
                var1 = contractURI();
                goto label_01BC;
            } else if (var0 == 0xe985e9c5) {
                // Dispatch table entry for isApprovedForAll(address,address)
                var1 = msg.value;
            
                if (var1) { revert(memory[0x00:0x00]); }
            
                var1 = 0x0197;
                var2 = 0x0407;
                var3 = msg.data.length;
                var4 = 0x04;
                var2, var3 = func_14AF(var3, var4);
                var1 = func_0407(var2, var3);
                goto label_0197;
            } else if (var0 == 0xf242432a) {
                // Dispatch table entry for safeTransferFrom(address,address,uint256,uint256,bytes)
                var1 = msg.value;
            
                if (var1) { revert(memory[0x00:0x00]); }
            
                var1 = 0x01fc;
                var2 = 0x042a;
                var3 = msg.data.length;
                var4 = 0x04;
                var2, var3, var4, var5, var6 = func_14E2(var3, var4);
                func_042A(var2, var3, var4, var5, var6);
                stop();
            } else if (var0 == 0xffd31af6) {
                // Dispatch table entry for 0xffd31af6 (unknown)
                var1 = msg.value;
            
                if (var1) { revert(memory[0x00:0x00]); }
            
                var1 = 0x0197;
                var2 = storage[0x06] & 0xff;
                goto label_0197;
            } else { revert(memory[0x00:0x00]); }
        } else if (msg.data.length) { revert(memory[0x00:0x00]); }
        else { stop(); }
    }
    
    function func_015F(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
    
        if (arg0 & (0x01 << 0xa0) - 0x01) {
            memory[0x00:0x20] = arg1;
            memory[0x20:0x40] = 0x00;
            var temp0 = keccak256(memory[0x00:0x40]);
            memory[0x00:0x20] = arg0 & (0x01 << 0xa0) - 0x01;
            memory[0x20:0x40] = temp0;
            return storage[keccak256(memory[0x00:0x40])];
        } else {
            var temp1 = memory[0x40:0x60];
            memory[temp1:temp1 + 0x20] = 0x461bcd << 0xe5;
            memory[temp1 + 0x04:temp1 + 0x04 + 0x20] = 0x20;
            memory[temp1 + 0x24:temp1 + 0x24 + 0x20] = 0x2a;
            memory[temp1 + 0x44:temp1 + 0x44 + 0x20] = 0x455243313135353a2061646472657373207a65726f206973206e6f7420612076;
            memory[temp1 + 0x64:temp1 + 0x64 + 0x20] = 0x30b634b21037bbb732b9 << 0xb1;
            var var1 = temp1 + 0x84;
            var temp2 = memory[0x40:0x60];
            revert(memory[temp2:temp2 + var1 - temp2]);
        }
    }
    
    function func_0192(var arg0) returns (var r0) {
        var var0 = 0x00;
        var var1 = arg0 & ~((0x01 << 0xe0) - 0x01) == 0x6cdb3d13 << 0xe1;
    
        if (!var1) {
            var1 = arg0 & ~((0x01 << 0xe0) - 0x01) == 0x03a24d07 << 0xe2;
        
            if (var1) { goto label_052B; }
            else { goto label_0516; }
        } else if (var1) {
        label_052B:
            return var1;
        } else {
        label_0516:
            return arg0 & ~((0x01 << 0xe0) - 0x01) == 0x01ffc9a7 << 0xe0;
        }
    }
    
    function func_01E4(var arg0) returns (var r0) {
        var var0 = 0x60;
    
        if (arg0 <= 0x00) { revert(memory[0x00:0x00]); }
    
        var var1 = 0x02;
        var var2 = 0x05d9;
        var var3 = arg0;
        var2 = func_0A65(var3);
        var temp0 = var1;
        var1 = 0x05ea;
        var temp1 = var2;
        var2 = temp0;
        var3 = temp1;
        var var4 = memory[0x40:0x60] + 0x20;
        var1 = func_161A(var2, var3, var4);
        var temp2 = memory[0x40:0x60];
        var temp3 = var1;
        memory[temp2:temp2 + 0x20] = temp3 - temp2 - 0x20;
        memory[0x40:0x60] = temp3;
        return temp2;
    }
    
    function func_01F7(var arg0, var arg1, var arg2) {
        var temp0 = memory[0x40:0x60];
        memory[temp0:temp0 + 0x20] = 0x00;
        memory[0x40:0x60] = temp0 + 0x20;
        var var0 = 0x061e;
        var var1 = arg0;
        var var2 = arg1;
        var var3 = arg2;
        var var4 = temp0;
        func_0B6E(var1, var2, var3, var4);
    }
    
    function func_023A(var arg0) returns (var arg0) {
        memory[0x20:0x40] = 0x08;
        memory[0x00:0x20] = arg0;
        return storage[keccak256(memory[0x00:0x40])];
    }
    
    function func_0309(var arg0) returns (var arg0) {
        memory[0x20:0x40] = 0x07;
        memory[0x00:0x20] = arg0;
        return storage[keccak256(memory[0x00:0x40])] & 0xff;
    }
    
    function func_03A6(var arg0) returns (var r0) {
        memory[0x00:0x20] = arg0;
        memory[0x20:0x40] = 0x08;
        return storage[keccak256(memory[0x00:0x40])];
    }
    
    function func_0407(var arg0, var arg1) returns (var r0) { return 0x01; }
    
    function func_042A(var arg0, var arg1, var arg2, var arg3, var arg4) {
        var var0 = 0x0a0b;
        var var1 = arg0;
        var var2 = arg1;
        var var3 = arg2;
        var var4 = arg3;
        var var5 = arg4;
        func_0E98(var1, var2, var3, var4, var5);
        var0 = arg1 & (0x01 << 0xa0) - 0x01;
        var1 = 0x3884d635;
        var temp0 = memory[0x40:0x60];
        memory[temp0:temp0 + 0x20] = (var1 & 0xffffffff) << 0xe0;
        var2 = temp0 + 0x04;
        var3 = 0x00;
        var4 = memory[0x40:0x60];
        var5 = var2 - var4;
        var var6 = var4;
        var var7 = 0x00;
        var var8 = var0;
        var var9 = !address(var8).code.length;
    
        if (var9) { revert(memory[0x00:0x00]); }
    
        var temp1;
        temp1, memory[var4:var4 + var3] = address(var8).call.gas(msg.gas).value(var7)(memory[var6:var6 + var5]);
        var3 = !temp1;
    
        if (!var3) { return; }
    
        var temp2 = returndata.length;
        memory[0x00:0x00 + temp2] = returndata[0x00:0x00 + temp2];
        revert(memory[0x00:0x00 + returndata.length]);
    }
    
    function func_0531() returns (var r0) {
        r0 = 0x03;
        var var1 = 0x053e;
        var var2 = storage[r0];
        var1 = func_1547(var2);
        var temp0 = var1;
        var temp1 = memory[0x40:0x60];
        memory[0x40:0x60] = temp1 + (temp0 + 0x1f) / 0x20 * 0x20 + 0x20;
        var temp2 = r0;
        r0 = temp1;
        var1 = temp2;
        var2 = temp0;
        memory[r0:r0 + 0x20] = var2;
        var var3 = r0 + 0x20;
        var var4 = var1;
        var var6 = storage[var4];
        var var5 = 0x056a;
        var5 = func_1547(var6);
    
        if (!var5) {
        label_05B7:
            return r0;
        } else if (0x1f < var5) {
            var temp3 = var3;
            var temp4 = temp3 + var5;
            var3 = temp4;
            memory[0x00:0x20] = var4;
            var temp5 = keccak256(memory[0x00:0x20]);
            memory[temp3:temp3 + 0x20] = storage[temp5];
            var4 = temp5 + 0x01;
            var5 = temp3 + 0x20;
        
            if (var3 <= var5) { goto label_05AE; }
        
        label_059A:
            var temp6 = var4;
            var temp7 = var5;
            memory[temp7:temp7 + 0x20] = storage[temp6];
            var4 = temp6 + 0x01;
            var5 = temp7 + 0x20;
        
            if (var3 > var5) { goto label_059A; }
        
        label_05AE:
            var temp8 = var3;
            var temp9 = temp8 + (var5 - temp8 & 0x1f);
            var5 = temp8;
            var3 = temp9;
            goto label_05B7;
        } else {
            var temp10 = var3;
            memory[temp10:temp10 + 0x20] = storage[var4] / 0x0100 * 0x0100;
            var5 = var5;
            var3 = temp10 + 0x20;
            goto label_05B7;
        }
    }
    
    function withdraw() {
        var temp0 = memory[0x40:0x60];
        var temp1 = address(this).balance;
        var var0 = temp1;
        var temp2;
        temp2, memory[temp0:temp0 + 0x00] = address(storage[0x0a] & (0x01 << 0xa0) - 0x01).call.gas(!var0 * 0x08fc).value(var0)(memory[temp0:temp0 + 0x00]);
        var var1 = !temp2;
    
        if (!var1) { return; }
    
        var temp3 = returndata.length;
        memory[0x00:0x00 + temp3] = returndata[0x00:0x00 + temp3];
        revert(memory[0x00:0x00 + returndata.length]);
    }
    
    function symbol() returns (var r0) {
        r0 = 0x04;
        var var1 = 0x053e;
        var var2 = storage[r0];
        var1 = func_1547(var2);
        var temp0 = var1;
        var temp1 = memory[0x40:0x60];
        memory[0x40:0x60] = temp1 + (temp0 + 0x1f) / 0x20 * 0x20 + 0x20;
        var temp2 = r0;
        r0 = temp1;
        var1 = temp2;
        var2 = temp0;
        memory[r0:r0 + 0x20] = var2;
        var var3 = r0 + 0x20;
        var var4 = var1;
        var var6 = storage[var4];
        var var5 = 0x056a;
        var5 = func_1547(var6);
    
        if (!var5) {
        label_05B7:
            return r0;
        } else if (0x1f < var5) {
            var temp3 = var3;
            var temp4 = temp3 + var5;
            var3 = temp4;
            memory[0x00:0x20] = var4;
            var temp5 = keccak256(memory[0x00:0x20]);
            memory[temp3:temp3 + 0x20] = storage[temp5];
            var4 = temp5 + 0x01;
            var5 = temp3 + 0x20;
        
            if (var3 <= var5) { goto label_05AE; }
        
        label_059A:
            var temp6 = var4;
            var temp7 = var5;
            memory[temp7:temp7 + 0x20] = storage[temp6];
            var4 = temp6 + 0x01;
            var5 = temp7 + 0x20;
        
            if (var3 > var5) { goto label_059A; }
        
        label_05AE:
            var temp8 = var3;
            var temp9 = temp8 + (var5 - temp8 & 0x1f);
            var5 = temp8;
            var3 = temp9;
            goto label_05B7;
        } else {
            var temp10 = var3;
            memory[temp10:temp10 + 0x20] = storage[var4] / 0x0100 * 0x0100;
            var5 = var5;
            var3 = temp10 + 0x20;
            goto label_05B7;
        }
    }
    
    function contractURI() returns (var r0) {
        var var0 = 0x60;
        var var1 = 0x09ea;
        var var3 = memory[0x40:0x60] + 0x20;
        var var2 = 0x02;
        var1 = func_16BA(var2, var3);
        var temp0 = memory[0x40:0x60];
        var temp1 = var1;
        memory[temp0:temp0 + 0x20] = temp1 - temp0 - 0x20;
        memory[0x40:0x60] = temp1;
        return temp0;
    }
    
    function func_0A65(var arg0) returns (var r0) {
        var var0 = 0x60;
    
        if (0x00 - arg0) {
            var var1 = arg0;
            var var2 = 0x00;
        
            if (!var1) {
            label_0AB6:
                var var3 = 0x00;
                var var4 = var2;
            
                if (var4 <= 0xffffffffffffffff) {
                    var temp0 = memory[0x40:0x60];
                    var temp1 = var4;
                    var var5 = temp1;
                    var4 = temp0;
                    memory[var4:var4 + 0x20] = var5;
                    memory[0x40:0x60] = var4 + (var5 + 0x1f & ~0x1f) + 0x20;
                
                    if (!var5) {
                        var3 = var4;
                    
                        if (!arg0) {
                        label_0B66:
                            return var3;
                        } else {
                        label_0B06:
                            var4 = 0x0b10;
                            var5 = 0x01;
                            var var6 = var2;
                            var4 = func_170A(var5, var6);
                            var2 = var4;
                            var4 = 0x0b1d;
                            var5 = 0x0a;
                            var6 = arg0;
                            var4 = func_1721(var5, var6);
                            var5 = var4;
                            var4 = 0x0b28;
                            var6 = 0x30;
                            var4 = func_1735(var5, var6);
                            var4 = var4 << 0xf8;
                            var5 = var3;
                            var6 = var2;
                        
                            if (var6 < memory[var5:var5 + 0x20]) {
                                memory[var6 + 0x20 + var5:var6 + 0x20 + var5 + 0x01] = byte(var4 & ~((0x01 << 0xf8) - 0x01), 0x00);
                                var4 = 0x0b5f;
                                var5 = 0x0a;
                                var6 = arg0;
                                var4 = func_16F6(var5, var6);
                                arg0 = var4;
                            
                                if (!arg0) { goto label_0B66; }
                                else { goto label_0B06; }
                            } else {
                                var var7 = 0x0b3d;
                                memory[0x00:0x20] = 0x4e487b71 << 0xe0;
                                memory[0x04:0x24] = 0x32;
                                revert(memory[0x00:0x24]);
                            }
                        }
                    } else {
                        var temp2 = var5;
                        memory[var4 + 0x20:var4 + 0x20 + temp2] = msg.data[msg.data.length:msg.data.length + temp2];
                        var3 = var4;
                    
                        if (!arg0) { goto label_0B66; }
                        else { goto label_0B06; }
                    }
                } else {
                    var5 = 0x0ad1;
                    memory[0x00:0x20] = 0x4e487b71 << 0xe0;
                    memory[0x04:0x24] = 0x41;
                    revert(memory[0x00:0x24]);
                }
            } else {
            label_0A97:
                var3 = var2;
                var4 = 0x0aa0;
                var5 = var3;
                var4 = func_166B(var5);
                var2 = var4;
                var3 = 0x0aaf;
                var4 = 0x0a;
                var5 = var1;
                var3 = func_16F6(var4, var5);
                var1 = var3;
            
                if (!var1) { goto label_0AB6; }
                else { goto label_0A97; }
            }
        } else {
            var temp3 = memory[0x40:0x60];
            memory[0x40:0x60] = temp3 + 0x40;
            memory[temp3:temp3 + 0x20] = 0x01;
            memory[temp3 + 0x20:temp3 + 0x20 + 0x20] = 0x03 << 0xfc;
            return temp3;
        }
    }
    
    function func_0B6E(var arg0, var arg1, var arg2, var arg3) {
        if (arg0 & (0x01 << 0xa0) - 0x01) {
            memory[0x00:0x20] = arg1;
            memory[0x20:0x40] = 0x00;
            var temp0 = keccak256(memory[0x00:0x40]);
            memory[0x00:0x20] = arg0 & (0x01 << 0xa0) - 0x01;
            memory[0x20:0x40] = temp0;
            var var0 = msg.sender;
            var var3 = 0x00;
            var var1 = arg2;
            var var2 = keccak256(memory[var3:var3 + 0x40]);
            var var4 = 0x0c00;
            var var6 = storage[var2];
            var var5 = var1;
            var4 = func_1735(var5, var6);
            storage[var2] = var4;
            memory[0x00:0x20] = arg1;
            memory[0x20:0x40] = 0x08;
            var2 = keccak256(memory[0x00:0x40]);
            var1 = arg2;
            var3 = 0x00;
            var4 = 0x0c23;
            var6 = storage[var2];
            var5 = var1;
            var4 = func_1735(var5, var6);
            storage[var2] = var4;
            var temp1 = memory[0x40:0x60];
            memory[temp1:temp1 + 0x20] = arg1;
            memory[temp1 + 0x20:temp1 + 0x20 + 0x20] = arg2;
            var temp2 = (0x01 << 0xa0) - 0x01;
            var temp3 = memory[0x40:0x60];
            log(memory[temp3:temp3 + (temp1 + 0x40) - temp3], [0xc3d58168c5ae7397731d063d5bbf3d657854427343f4c083240f7aacaa2d0f62, stack[-5] & (0x01 << 0xa0) - 0x01, 0x00, stack[-9] & (0x01 << 0xa0) - 0x01]);
            return;
        } else {
            var temp4 = memory[0x40:0x60];
            memory[temp4:temp4 + 0x20] = 0x461bcd << 0xe5;
            memory[temp4 + 0x04:temp4 + 0x04 + 0x20] = 0x20;
            memory[temp4 + 0x24:temp4 + 0x24 + 0x20] = 0x21;
            memory[temp4 + 0x44:temp4 + 0x44 + 0x20] = 0x455243313135353a206d696e7420746f20746865207a65726f20616464726573;
            memory[temp4 + 0x64:temp4 + 0x64 + 0x20] = 0x73 << 0xf8;
            var0 = temp4 + 0x84;
            var temp5 = memory[0x40:0x60];
            revert(memory[temp5:temp5 + var0 - temp5]);
        }
    }
    
    function func_0DB8(var arg0, var arg1, var arg2) {
        if ((arg0 & (0x01 << 0xa0) - 0x01) - (arg1 & (0x01 << 0xa0) - 0x01)) {
            var temp0 = (0x01 << 0xa0) - 0x01;
            var temp1 = temp0 & arg0;
            memory[0x00:0x20] = temp1;
            memory[0x20:0x40] = 0x01;
            var temp2 = keccak256(memory[0x00:0x40]);
            var temp3 = arg1 & temp0;
            memory[0x00:0x20] = temp3;
            memory[0x20:0x40] = temp2;
            var temp4 = keccak256(memory[0x00:0x40]);
            var temp5 = !!arg2;
            storage[temp4] = temp5 | (storage[temp4] & ~0xff);
            var temp6 = memory[0x40:0x60];
            memory[temp6:temp6 + 0x20] = temp5;
            var temp7 = memory[0x40:0x60];
            log(memory[temp7:temp7 + (temp6 + 0x20) - temp7], [0x17307eab39ab6107e8899845ad3d59bd9653f200f220920489ca2b5937696c31, stack[-3] & (0x01 << 0xa0) - 0x01, stack[-2] & (0x01 << 0xa0) - 0x01]);
            return;
        } else {
            var temp8 = memory[0x40:0x60];
            memory[temp8:temp8 + 0x20] = 0x461bcd << 0xe5;
            memory[temp8 + 0x04:temp8 + 0x04 + 0x20] = 0x20;
            memory[temp8 + 0x24:temp8 + 0x24 + 0x20] = 0x29;
            memory[temp8 + 0x44:temp8 + 0x44 + 0x20] = 0x455243313135353a2073657474696e6720617070726f76616c20737461747573;
            memory[temp8 + 0x64:temp8 + 0x64 + 0x20] = 0x103337b91039b2b633 << 0xb9;
            var var0 = temp8 + 0x84;
            var temp9 = memory[0x40:0x60];
            revert(memory[temp9:temp9 + var0 - temp9]);
        }
    }
    
    function func_0E98(var arg0, var arg1, var arg2, var arg3, var arg4) {
        memory[0x00:0x20] = arg2;
        memory[0x20:0x40] = 0x00;
        var temp0 = keccak256(memory[0x00:0x40]);
        var temp1 = (0x01 << 0xa0) - 0x01;
        memory[0x00:0x20] = temp1 & arg0;
        memory[0x20:0x40] = temp0;
        var temp2 = keccak256(memory[0x00:0x40]);
        var temp3 = storage[temp2];
        storage[temp2] = temp3 - arg3;
        var var1 = temp3;
        memory[0x00:0x20] = arg1 & temp1;
        var var4 = 0x00;
        var var0 = msg.sender;
        var var2 = arg3;
        var var3 = keccak256(memory[var4:var4 + 0x40]);
        var var5 = 0x0eda;
        var var6 = var2;
        var var7 = storage[var3];
        var5 = func_1735(var6, var7);
        storage[var3] = var5;
        var temp4 = memory[0x40:0x60];
        memory[temp4:temp4 + 0x20] = arg2;
        memory[temp4 + 0x20:temp4 + 0x20 + 0x20] = arg3;
        var temp5 = (0x01 << 0xa0) - 0x01;
        var temp6 = memory[0x40:0x60];
        log(memory[temp6:temp6 + (temp4 + 0x40) - temp6], [0xc3d58168c5ae7397731d063d5bbf3d657854427343f4c083240f7aacaa2d0f62, stack[-6] & (0x01 << 0xa0) - 0x01, stack[-11] & (0x01 << 0xa0) - 0x01, stack[-10] & (0x01 << 0xa0) - 0x01]);
    }
    
    function func_0FB9(var arg0, var arg1) returns (var r0) {
        if (arg0 <= arg1) {
        label_0FB5:
            return arg0;
        } else {
        label_0FC3:
            var temp0 = arg1;
            storage[temp0] = 0x00;
            arg1 = temp0 + 0x01;
        
            if (arg0 <= arg1) { goto label_0FB5; }
            else { goto label_0FC3; }
        }
    }
    
    function withdraw(var arg0) returns (var r0) {
        var temp0 = msg.data[arg0:arg0 + 0x20];
        var var0 = temp0;
    
        if (var0 == var0 & (0x01 << 0xa0) - 0x01) { return var0; }
        else { revert(memory[0x00:0x00]); }
    }
    
    function func_0FEA(var arg0, var arg1) returns (var r0, var arg0) {
        var var0 = 0x00;
        var var1 = var0;
    
        if (arg0 - arg1 i< 0x40) { revert(memory[0x00:0x00]); }
    
        var var2 = 0x1006;
        var var3 = arg1;
        var2 = withdraw(var3);
        r0 = var2;
        arg0 = msg.data[arg1 + 0x20:arg1 + 0x20 + 0x20];
        return r0, arg0;
    }
    
    function func_1014(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
    
        if (arg0 - arg1 i< 0x20) { revert(memory[0x00:0x00]); }
    
        var temp0 = msg.data[arg1:arg1 + 0x20];
        var var1 = temp0;
    
        if (var1 == var1 & ~((0x01 << 0xe0) - 0x01)) { return var1; }
        else { revert(memory[0x00:0x00]); }
    }
    
    function func_1045(var arg0, var arg1, var arg2) {
        var var0 = 0x00;
    
        if (var0 >= arg0) {
        label_1060:
        
            if (var0 <= arg0) { return; }
        
            memory[arg1 + arg0:arg1 + arg0 + 0x20] = 0x00;
            return;
        } else {
        label_1051:
            var temp0 = var0;
            memory[temp0 + arg1:temp0 + arg1 + 0x20] = memory[temp0 + arg2:temp0 + arg2 + 0x20];
            var0 = temp0 + 0x20;
        
            if (var0 >= arg0) { goto label_1060; }
            else { goto label_1051; }
        }
    }
    
    function func_1075(var arg0, var arg1) returns (var r0) {
        var temp0 = arg1;
        memory[temp0:temp0 + 0x20] = 0x20;
        var var0 = 0x00;
        var temp1 = arg0;
        var temp2 = memory[temp1:temp1 + 0x20];
        var var1 = temp2;
        memory[temp0 + 0x20:temp0 + 0x20 + 0x20] = var1;
        var var2 = 0x1094;
        var var3 = var1;
        var var4 = temp0 + 0x40;
        var var5 = temp1 + 0x20;
        func_1045(var3, var4, var5);
        return (var1 + 0x1f & ~0x1f) + arg1 + 0x40;
    }
    
    function func_10A8(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
    
        if (arg0 - arg1 i>= 0x20) { return msg.data[arg1:arg1 + 0x20]; }
        else { revert(memory[0x00:0x00]); }
    }
    
    function func_10C1(var arg0, var arg1) returns (var r0, var arg0, var arg1) {
        var var0 = 0x00;
        var var1 = var0;
        var var2 = 0x00;
    
        if (arg0 - arg1 i< 0x60) { revert(memory[0x00:0x00]); }
    
        var var3 = 0x10df;
        var var4 = arg1;
        var3 = withdraw(var4);
        r0 = var3;
        var temp0 = arg1;
        arg0 = msg.data[temp0 + 0x20:temp0 + 0x20 + 0x20];
        arg1 = msg.data[temp0 + 0x40:temp0 + 0x40 + 0x20];
        return r0, arg0, arg1;
    }
    
    function func_110A(var arg0) returns (var r0) {
        var temp0 = memory[0x40:0x60];
        var var0 = temp0;
        var temp1 = var0 + (arg0 + 0x1f & ~0x1f);
        var var1 = temp1;
    
        if (!((var1 < var0) | (var1 > 0xffffffffffffffff))) {
            memory[0x40:0x60] = var1;
            return var0;
        } else {
            var var2 = 0x1133;
            memory[0x00:0x20] = 0x4e487b71 << 0xe0;
            memory[0x04:0x24] = 0x41;
            revert(memory[0x00:0x24]);
        }
    }
    
    function func_113B(var arg0) returns (var r0) {
        var var0 = 0x00;
    
        if (arg0 <= 0xffffffffffffffff) { return (arg0 << 0x05) + 0x20; }
    
        var var1 = 0x1155;
        memory[0x00:0x20] = 0x4e487b71 << 0xe0;
        memory[0x04:0x24] = 0x41;
        revert(memory[0x00:0x24]);
    }
    
    function func_115F(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
    
        if (arg1 + 0x1f i>= arg0) { revert(memory[0x00:0x00]); }
    
        var var1 = msg.data[arg1:arg1 + 0x20];
        var var2 = 0x20;
        var var3 = 0x1185;
        var var4 = 0x1180;
        var var5 = var1;
        var4 = func_113B(var5);
        var3 = func_1180(var4);
        var temp0 = var1;
        var temp1 = var3;
        memory[temp1:temp1 + 0x20] = temp0;
        var temp2 = var2;
        var1 = temp2 + arg1 + (temp0 << 0x05);
        var3 = temp1 + temp2;
        var4 = temp1;
    
        if (var1 > arg0) { revert(memory[0x00:0x00]); }
    
        var5 = arg1 + var2;
    
        if (var5 >= var1) {
        label_11BF:
            return var4;
        } else {
        label_11B1:
            var temp3 = var5;
            var temp4 = var3;
            memory[temp4:temp4 + 0x20] = msg.data[temp3:temp3 + 0x20];
            var temp5 = var2;
            var3 = temp5 + temp4;
            var5 = temp5 + temp3;
        
            if (var5 >= var1) { goto label_11BF; }
            else { goto label_11B1; }
        }
    }
    
    function func_1180(var arg0) returns (var r0) {
        r0 = func_110A(arg0);
        // Error: Could not resolve method call return address!
    }
    
    function func_11CA(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
    
        if (arg1 + 0x1f i>= arg0) { revert(memory[0x00:0x00]); }
    
        var var1 = msg.data[arg1:arg1 + 0x20];
    
        if (var1 <= 0xffffffffffffffff) {
            var var2 = 0x1208;
            var var3 = (var1 + 0x1f & ~0x1f) + 0x20;
            var2 = func_110A(var3);
            var temp0 = var1;
            memory[var2:var2 + 0x20] = temp0;
        
            if (arg1 + temp0 + 0x20 > arg0) { revert(memory[0x00:0x00]); }
        
            var temp1 = var1;
            var temp2 = var2;
            memory[temp2 + 0x20:temp2 + 0x20 + temp1] = msg.data[arg1 + 0x20:arg1 + 0x20 + temp1];
            memory[temp2 + temp1 + 0x20:temp2 + temp1 + 0x20 + 0x20] = 0x00;
            return temp2;
        } else {
            var2 = 0x11f5;
            memory[0x00:0x20] = 0x4e487b71 << 0xe0;
            memory[0x04:0x24] = 0x41;
            revert(memory[0x00:0x24]);
        }
    }
    
    function func_12E4(var arg0, var arg1) returns (var r0, var arg0) {
        var var0 = 0x00;
        var var1 = var0;
    
        if (arg0 - arg1 i< 0x40) { revert(memory[0x00:0x00]); }
    
        var var2 = msg.data[arg1:arg1 + 0x20];
        var var3 = 0xffffffffffffffff;
    
        if (var2 > var3) { revert(memory[0x00:0x00]); }
    
        var var4 = 0x131b;
        var var5 = arg0;
        var var6 = arg1 + var2;
        var4 = func_11CA(var5, var6);
        var0 = var4;
        var2 = msg.data[arg1 + 0x20:arg1 + 0x20 + 0x20];
    
        if (var2 > var3) { revert(memory[0x00:0x00]); }
    
        var3 = 0x133e;
        var4 = arg0;
        var5 = arg1 + var2;
        var3 = func_11CA(var4, var5);
        arg0 = var3;
        r0 = var0;
        return r0, arg0;
    }
    
    function func_1467(var arg0) {
        var temp0 = arg0;
    
        if (temp0 == !!temp0) { return; }
        else { revert(memory[0x00:0x00]); }
    }
    
    function func_1478(var arg0, var arg1) returns (var r0, var arg0) {
        var var0 = 0x00;
        var var1 = var0;
    
        if (arg0 - arg1 i< 0x40) { revert(memory[0x00:0x00]); }
    
        var var2 = 0x1494;
        var var3 = arg1;
        var2 = withdraw(var3);
        var0 = var2;
        var2 = msg.data[arg1 + 0x20:arg1 + 0x20 + 0x20];
        var3 = 0x14a4;
        var var4 = var2;
        func_1467(var4);
        arg0 = var2;
        r0 = var0;
        return r0, arg0;
    }
    
    function func_14AF(var arg0, var arg1) returns (var r0, var arg0) {
        var var0 = 0x00;
        var var1 = var0;
    
        if (arg0 - arg1 i< 0x40) { revert(memory[0x00:0x00]); }
    
        var var2 = 0x14cb;
        var var3 = arg1;
        var2 = withdraw(var3);
        var0 = var2;
        var2 = 0x14d9;
        var3 = arg1 + 0x20;
        var2 = withdraw(var3);
        arg0 = var2;
        r0 = var0;
        return r0, arg0;
    }
    
    function func_14E2(var arg0, var arg1) returns (var r0, var arg0, var arg1, var r3, var r4) {
        r3 = 0x00;
        r4 = r3;
        var var2 = 0x00;
        var var3 = var2;
        var var4 = 0x00;
    
        if (arg0 - arg1 i< 0xa0) { revert(memory[0x00:0x00]); }
    
        var var5 = 0x1503;
        var var6 = arg1;
        var5 = withdraw(var6);
        r3 = var5;
        var5 = 0x1511;
        var6 = arg1 + 0x20;
        var5 = withdraw(var6);
        r4 = var5;
        var temp0 = arg1;
        var2 = msg.data[temp0 + 0x40:temp0 + 0x40 + 0x20];
        var3 = msg.data[temp0 + 0x60:temp0 + 0x60 + 0x20];
        var5 = msg.data[temp0 + 0x80:temp0 + 0x80 + 0x20];
    
        if (var5 > 0xffffffffffffffff) { revert(memory[0x00:0x00]); }
    
        var6 = 0x12d7;
        var var7 = arg0;
        var var8 = arg1 + var5;
        var6 = func_11CA(var7, var8);
        var temp1 = r4;
        r4 = var6;
        arg0 = temp1;
        var temp2 = r3;
        r3 = var3;
        r0 = temp2;
        arg1 = var2;
        return r0, arg0, arg1, r3, r4;
    }
    
    function func_1547(var arg0) returns (var r0) {
        var temp0 = arg0;
        var var0 = temp0 >> 0x01;
        var var1 = temp0 & 0x01;
    
        if (!var1) {
            var temp1 = var0 & 0x7f;
            var0 = temp1;
        
            if (var1 - (var0 < 0x20)) { goto label_157B; }
            else { goto label_1566; }
        } else if (var1 - (var0 < 0x20)) {
        label_157B:
            return var0;
        } else {
        label_1566:
            memory[0x00:0x20] = 0x4e487b71 << 0xe0;
            memory[0x04:0x24] = 0x22;
            revert(memory[0x00:0x24]);
        }
    }
    
    function func_1581(var arg0, var arg1) returns (var r0) {
        var temp0 = storage[arg1];
        var var0 = 0x00;
        var var1 = temp0;
        var var3 = 0x01;
        var var2 = var1 >> var3;
        var var4 = var1 & var3;
    
        if (var4) {
            var var5 = 0x20;
        
            if (var4 - (var2 < var5)) {
            label_15BC:
                var var6 = var4;
            
                if (!var6) {
                    var temp1 = arg0;
                    memory[temp1:temp1 + 0x20] = var1 & ~0xff;
                    var0 = temp1 + var2;
                
                label_160E:
                    return var0;
                } else if (var6 == 0x01) {
                    memory[0x00:0x20] = arg1;
                    var var7 = keccak256(memory[0x00:0x20]);
                    var var8 = 0x00;
                
                    if (var8 >= var2) {
                    label_1606:
                        return arg0 + var2;
                    } else {
                    label_15F6:
                        var temp2 = var7;
                        var temp3 = var8;
                        memory[temp3 + arg0:temp3 + arg0 + 0x20] = storage[temp2];
                        var7 = var3 + temp2;
                        var8 = var5 + temp3;
                    
                        if (var8 >= var2) { goto label_1606; }
                        else { goto label_15F6; }
                    }
                } else { goto label_160E; }
            } else {
            label_15A7:
                memory[0x00:0x20] = 0x4e487b71 << 0xe0;
                memory[0x04:0x24] = 0x22;
                revert(memory[0x00:0x24]);
            }
        } else {
            var temp4 = var2 & 0x7f;
            var2 = temp4;
            var5 = 0x20;
        
            if (var4 - (var2 < var5)) { goto label_15BC; }
            else { goto label_15A7; }
        }
    }
    
    function func_161A(var arg0, var arg1, var arg2) returns (var r0) {
        var var0 = 0x00;
        var var1 = 0x1626;
        var var2 = arg2;
        var var3 = arg0;
        var1 = func_1581(var2, var3);
        var temp0 = arg1;
        var2 = memory[temp0:temp0 + 0x20];
        var3 = 0x1636;
        var var4 = var2;
        var var5 = var1;
        var var6 = temp0 + 0x20;
        func_1045(var4, var5, var6);
        return var2 + var1;
    }
    
    function func_166B(var arg0) returns (var r0) {
        var var0 = 0x00;
    
        if (arg0 + 0x01) { return arg0 + 0x01; }
    
        var var1 = 0x167d;
        memory[0x00:0x20] = 0x4e487b71 << 0xe0;
        memory[0x04:0x24] = 0x11;
        revert(memory[0x00:0x24]);
    }
    
    function func_16BA(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
        var var1 = 0x16c6;
        var var2 = arg1;
        var var3 = arg0;
        var1 = func_1581(var2, var3);
        var temp0 = var1;
        memory[temp0:temp0 + 0x20] = 0x31b7b63632b1ba34b7b7 << 0xb1;
        return temp0 + 0x0a;
    }
    
    function func_16F6(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
    
        if (arg0) { return arg1 / arg0; }
    
        var var1 = 0x1705;
        memory[0x00:0x20] = 0x4e487b71 << 0xe0;
        memory[0x04:0x24] = 0x12;
        revert(memory[0x00:0x24]);
    }
    
    function func_170A(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
    
        if (arg1 >= arg0) { return arg1 - arg0; }
    
        var var1 = 0x171c;
        memory[0x00:0x20] = 0x4e487b71 << 0xe0;
        memory[0x04:0x24] = 0x11;
        revert(memory[0x00:0x24]);
    }
    
    function func_1721(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
    
        if (arg0) { return arg1 % arg0; }
    
        var var1 = 0x1730;
        memory[0x00:0x20] = 0x4e487b71 << 0xe0;
        memory[0x04:0x24] = 0x12;
        revert(memory[0x00:0x24]);
    }
    
    function func_1735(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
    
        if (arg1 <= ~arg0) { return arg1 + arg0; }
    
        var var1 = 0x1748;
        memory[0x00:0x20] = 0x4e487b71 << 0xe0;
        memory[0x04:0x24] = 0x11;
        revert(memory[0x00:0x24]);
    }
}

