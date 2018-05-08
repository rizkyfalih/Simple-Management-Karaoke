{File   : Tubes.pas}
{Desc   : Program Majemen Karaoke}
{Date   : 18 April 2016}

program Karaoke;
uses crt;

type userrecord= record
        username,pass,nama,email,nohp:string;
     end;

type kamarrecord=record
        jenis,fasilitas,jam,harga,username,status,room:string;
     end;

var
        menu,room,i:longint;
        kamar:kamarrecord;
        user:userrecord;
        datauser: text;
        datakamar:text;
        kamaradmin:text;
        kamarlunas:text;
        file_user: file of userrecord;
        file_kamar: file of kamarrecord;
        //file_listuser:file of userrecord;
        password,answer,tipe,nama,tempuser,tempkamar,usernameadmin:string;
        username,jenis:string;
        kondisi:boolean;
        status:boolean;

        procedure menu_user;forward;
        procedure welcome;forward;
        procedure main_menu;forward;
        procedure menu_admin;forward;
        procedure dataBook;forward;
        procedure BookKam;forward;
        procedure hapuskamar;forward;
        procedure hapususer;forward;
        procedure dataroom;forward;
        procedure inputkamar;forward;
        procedure login;forward;
        procedure data;forward;
        procedure admin;forward;
        procedure registrasi;forward;
        procedure kwitansi;forward;
        procedure konfirmasi;forward;
        procedure konfirmasipembayaran;forward;
        procedure log;forward;
        procedure info;forward;

        procedure log;
        var
                a:integer;
        begin
                clrscr;
                writeln('**********Log Pembayaran**********');
                assign(kamaradmin,'kamaradmin.txt');
                reset(kamaradmin);
                a:=0;
                while not EOF (kamaradmin) do
                begin
                        a:=a+1;
                        readln(kamaradmin,tempkamar);
                        assign(file_kamar,tempkamar);
                        reset(file_kamar);
                        read(file_kamar,kamar);
                        if (username=kamar.username) then
                        begin
                                writeln('Jenis               :',kamar.Jenis);
                                writeln('Fasilitas           :',kamar.fasilitas);
                                writeln('Harga               :',kamar.harga);
                                writeln('Status              :',kamar.status);
                                writeln;
                        end;
                        close(file_kamar);
                end;
                close(kamaradmin);
                assign(kamarlunas,'kamarlunas.txt');
                reset(kamarlunas);
                a:=0;
                while not EOF (kamarlunas) do
                begin
                        a:=a+1;
                        readln(kamarlunas,tempkamar);
                        assign(file_kamar,tempkamar);
                        reset(file_kamar);
                        read(file_kamar,kamar);
                        if (username=kamar.username) then
                        begin
                                writeln('Jenis               :',kamar.Jenis);
                                writeln('Fasilitas           :',kamar.fasilitas);
                                writeln('Harga               :',kamar.harga);
                                writeln('Status              :',kamar.status);
                                writeln;
                        end;
                        close(file_kamar);
                end;
                close(kamarlunas);
                if a<1 then
                        begin
                                Writeln('Anda Belum Pernah Memesan Sama Sekali!');
                                writeln;
                                Writeln('Press Enter to Go Back!');
                        end;
                readln;
                menu_user;
        end;
        procedure konfirmasipembayaran;
        var
                a:integer;
        begin
                clrscr;
                writeln('>>>>>>>>>>Konfirmasi<<<<<<<<<<');
                writeln;
                assign(kamaradmin,'kamaradmin.txt');
                reset(kamaradmin);
                a:=0;
                while not EOF(kamaradmin) do
                begin
                        a:=a+1;
                        readln(kamaradmin,tempkamar);
                        assign(file_kamar,tempkamar);
                        reset(file_kamar);
                        read(file_kamar,kamar);
                        writeln('Username       :',kamar.username);
                        writeln('Jenis          :',kamar.jenis);
                        writeln('Fasilitas      :',kamar.fasilitas);
                        close(file_kamar);
                        writeln;
                end;
                close(kamaradmin);
                if(a<1) then
                begin
                        writeln('User yang Memesan Ruangan Tidak Ada!');
                        writeln;
                        writeln('Press Enter to Go Back!');
                        readln;
                        menu_admin;
                end
                else
                begin
                        write('Konfirmasi Semua Pembayaran? (y/t)');
                        readln(answer);
                        if(answer='t') then
                        begin
                                writeln;
                                writeln('Anda Menunda untuk Konfirmasi');
                                writeln;
                                writeln('Press Enter to Go Back!');
                                readln;
                                menu_admin;
                        end
                        else
                        begin
                                writeln;
                                writeln('Anda telah Mengkonfirmasi Semua Pembayaran!');
                                writeln;
                                writeln('Press Enter to Go Back!');
                                readln;
                                konfirmasi;
                         end;
                 end;
        end;

        procedure konfirmasi;
        begin
                clrscr;
                assign(kamaradmin,'kamaradmin.txt');
                reset(kamaradmin);
                while not EOF(kamaradmin) do
                begin
                        readln(kamaradmin,tempkamar);
                        assign(file_kamar,tempkamar);
                        reset(file_kamar);
                        read(file_kamar,kamar);
                        assign(file_user,kamar.username);
                        reset(file_user);
                        read(file_user,user);
                        kamar.status:='Lunas';
                        rewrite(file_kamar);
                        write(file_kamar,kamar);
                        rewrite(file_user);
                        write(file_user,user);
                        close(file_kamar);
                        close(file_user);
                        writeln;
                end;
                reset(kamaradmin);
                assign(kamarLunas,'kamarlunas.txt');
                append(kamarLunas);
                while not EOF (kamaradmin) do
                begin
                        readln(kamaradmin,tempkamar);
                        writeln(kamarlunas,tempkamar);
                end;
                rewrite(kamaradmin);
                close(kamaradmin);
                close(kamarlunas);
                menu_admin;
        end;

        procedure kwitansi;
        begin
                clrscr;
                writeln('+=====================+');
                writeln('| Kwitansi Pembayaran |');
                writeln('+=====================+');
                writeln;
                Assign(kamaradmin,'kamaradmin.txt');
                Reset(kamaradmin);
                while not EOF(kamaradmin) do
                begin
                        readln(kamaradmin,tempKamar);
                        Assign(file_kamar,tempKamar);
                        Reset(file_kamar);
                        read(file_kamar,kamar);
                        writeln;
                        writeln('Username               : ',kamar.username);
                        Writeln('Jenis                  : ',kamar.jenis);
                        Writeln('Fasilitas              : ',kamar.fasilitas);
                        Writeln('Harga                  : ',kamar.harga);
                        Writeln('jam                    : ',kamar.jam);
                        writeln('Status Pembayaran      : ',kamar.status);
                        Close(file_kamar);
                        Writeln;
                end;
                //writeln('room: ',user.room);
                Close(kamaradmin);
                writeln;
                Writeln('Press Enter to Go Back!');
                Readln;
                menu_user;
        end;



       { procedure pembatalanBook;
        var
                a,i:integer;
                usercopy:array[1..10] of string;
        begin
                clrscr;
                a:=0;
                i:=0;
                writeln('Pembatalan');
                assign(kamaradmin,'kamaradmin.txt');
                reset(kamaradmin);
                while not EOF(kamaradmin) do
                begin
                        readln(kamaradmin,tempkamar);
                        a:=a+1;
                        usercopy[a]:=tempkamar;
                        assign(file_kamar,tempkamar);
                        reset(file_kamar);
                        read(file_kamar,kamar);
                        writeln('Kode:',kamar.jenis);
                        close(file_kamar);
                end;
                rewrite(kamaradmin);
                write('Pilih Kode Booking:');
                readln(jenis);
                assign(file_kamar,jenis);
                for i:=1 to a do
                begin
                        if (jenis <> usercopy[i]) then
                        begin
                                writeln(kamaradmin,usercopy[i]);
                        end;
                end;
                close(kamaradmin);
                assign(datakamar,'datakamar.txt');
                append(datakamar);
                writeln(datakamar,jenis);
                close(datakamar);
                writeln('berhasi');
                writeln('enter');
                readln;
                menu_user;
        end;}
        procedure dataBook;
        begin
                clrscr;
                Assign(kamaradmin,'kamaradmin.txt');
                Reset(kamaradmin);
                while not EOF(kamaradmin) do
                begin
                        readln(kamaradmin,tempKamar);
                        Assign(file_kamar,tempKamar);
                        Reset(file_kamar);
                        read(file_kamar,kamar);
                        Writeln('Jenis: ',kamar.jenis);
                        Writeln('Fasilitas: ',kamar.fasilitas);
                        Writeln('Harga: ',kamar.harga);
                        Writeln('jam: ',kamar.jam);
                        Close(file_kamar);
                        Writeln;
                end;
                //writeln('room: ',user.room);
                Close(kamaradmin);
                Writeln('Press Enter Keys..');
                Readln;
                menu_admin;
        end;

        procedure BookKam;
        var
                a,i:integer;
                usercopy:array[1..10] of string;
        begin
                clrscr;
                a:=0;
                i:=0;
                writeln;
                writeln('+============================================+');
                writeln('|               Menu Booking                 |');
                writeln('+============================================+');
                writeln;
                assign(datakamar,'datakamar.txt');
                reset(datakamar);
                while not EOF(datakamar) do
                begin
                        readln(datakamar,tempkamar);
                        a:=a+1;
                        usercopy[a]:=tempkamar;
                        assign(file_kamar,tempkamar);
                        reset(file_kamar);
                        read(file_kamar,kamar);
                        writeln('List Kamar yang Akan Dipesan:',kamar.Jenis);
                        close(file_kamar);
                end;
                rewrite(datakamar);
                writeln;
                if (a<1) then
                        begin
                                writeln('Ruangan untuk Pemesanan Tidak Tersedia!');
                                writeln;
                                writeln('Press Enter to Go Back!');
                                readln;
                                menu_user;
                        end
                else
                begin
                write('Input Jenis Kamar:');
                readln(jenis);
                assign(file_kamar,jenis);
                reset(file_kamar);
                read(file_kamar,kamar);
                kamar.username:=username;
                kamar.status:='Belum Lunas';
                rewrite(file_kamar);
                write(file_kamar,kamar);
                close(file_kamar);
                for i:=1 to a do
                begin
                        if (jenis <> usercopy[i]) then
                        begin
                                writeln(datakamar,usercopy[i]);
                        end;
                end;
                close(datakamar);
                assign(kamaradmin,'kamaradmin.txt');
                append(kamaradmin);
                writeln(kamaradmin,jenis);
                close(kamaradmin);
                writeln('Anda Berhasil Memesan Ruangan!');
                writeln;
                writeln('Press Enter!');
                kwitansi;
                readln;
                end;

        end;

        procedure hapuskamar;
        var
                a,i:integer;
                usercopy:array[1..10] of string;
        begin
                clrscr;
                a:=0;
                i:=0;
                writeln('==============================');
                writeln('       Menu Delete Room       ');
                writeln('==============================');
                assign(datakamar,'datakamar.txt');
                reset(datakamar);
                while not EOF(datakamar) do
                begin
                        readln(datakamar,tempkamar);
                        a:=a+1;
                        usercopy[a]:=tempkamar;
                        assign(file_kamar,tempkamar);
                        reset(file_kamar);
                        read(file_kamar,kamar);
                        writeln('\\\\\\\\ Data Kamar ////////');
                        writeln('Jenis Ruangan          :',kamar.jenis);
                        writeln('Nomor Ruangan          :',kamar.room);
                        writeln('Fasilitas Ruangan      :',kamar.fasilitas);
                        writeln('Shift                  :',kamar.jam);
                        writeln('Harga                  :',kamar.harga);
                        close(file_kamar);
                end;
                rewrite(datakamar);
                if a<1 then
                        begin
                        writeln('Data Ruangan yang Tersedia Tidak ada');
                        close(datakamar);
                        end
                else
                begin
                        writeln;
                        write('Pilih Jenis Kamar yang Akan Di Hapus:');
                        readln(jenis);
                        assign(file_kamar,jenis);
                        erase(file_kamar);
                        for i:=1 to a do
                        begin
                                if (jenis <> usercopy[i]) then
                                begin
                                        writeln(datakamar,usercopy[i]);
                                end;
                        end;
                        close(datakamar);
                end;
                writeln;
                writeln('Press Enter to Go Back!');
                readln;
                menu_admin;
        end;


        procedure hapususer;
        var
                a,i:integer;
                usercopy:array[1..10] of string;
        begin
                clrscr;
                a:=0;
                i:=0;
                writeln('<<<<<<<<<<Hapus Data>>>>>>>>>>');
                writeln;
                assign(datauser,'datauser.txt');
                reset(datauser);
                while not EOF(datauser) do
                begin
                        readln(datauser,tempuser);
                        a:=a+1;
                        usercopy[a]:=tempuser;
                        assign(file_user,tempuser);
                        reset(file_user);
                        read(file_user,user);
                        writeln('nama:',user.nama);
                        writeln('username:',user.username);
                        writeln;
                        close(file_user);
                end;
                if a<1 then
                        begin
                        writeln('Tidak ada Data User yang Terdaftar!');
                        writeln;
                        writeln('Press Enter to Go Back!');
                        close(datauser);
                        end
                else
                begin
                        rewrite(datauser);
                        write('Pilih Username:');
                        readln(username);
                        assign(file_user,username);
                        erase(file_user);
                        for i:=1 to a do
                        begin
                                if (username <> usercopy[i]) then
                                begin
                                writeln(datauser,usercopy[i]);
                                end;
                         end;
                         close(datauser);
                         writeln('Data Berhasil Dihapus!');
                         writeln;
                         writeln('Press Enter to Go Back!');
                end;
                readln;
                menu_admin;
        end;

        //booking


        procedure dataroom;
        var
                a:integer;
        begin
                clrscr;
                a:=0;
                writeln('//////// Info Ruangan \\\\\\\\');
                writeln;
                Assign(datakamar,'datakamar.txt');
                Reset(datakamar);
                while not EOF(datakamar) do
                begin
                        a:=a+1;
                        readln(datakamar,tempKamar);
                        Assign(file_kamar,tempKamar);
                        Reset(file_kamar);
                        read(file_kamar,kamar);
                        Writeln('Jenis Ruangan  : ',kamar.jenis);
                        Writeln('Nomor Ruangan  : ',kamar.room);
                        Writeln('Fasilitas      : ',kamar.fasilitas);
                        Writeln('Harga          : ',kamar.harga);
                        Writeln('Jam            : ',kamar.jam);
                        Close(file_kamar);
                        Writeln;
                end;
                if a<1 then
                        begin
                                writeln('Tidak Ada Ruangan yang Tersedia');
                                writeln;
                        end;
                //writeln('room: ',user.room);
                Close(datakamar);
                Writeln('Press Enter Keys');
                Readln;
                menu_user;
        end;

        procedure inputKamar;
        begin
                clrscr;
                writeln('"""""""" Input Kamar """"""""');
                Assign(datakamar,'datakamar.txt');
                Append(datakamar);
                writeln;
                write('Jenis Ruangan                  : ');readln(kamar.jenis);
                write('Nomor Ruangan                  : ');readln(kamar.room);
                write('Fasilitas Ruangan              : ');readln(kamar.fasilitas);
                write('Shift                          : ');readln(kamar.jam);
                write('Harga                          : ');readln(kamar.harga);
                writeln(dataKamar,kamar.jenis);
                close(dataKamar);
                writeln;
                assign(file_kamar,kamar.jenis);
                rewrite(file_kamar);
                write(file_kamar,kamar);
                close(file_kamar);
                writeln('Data ruangan yang Anda Input Sudah Terdaftar!');
                readln;
                menu_admin;
        end;

      {  procedure bookingruangan;
        begin
                clrscr;
                writeln('BOOKING RUANGAN');
                Assign(datakamar,'datakamar.txt');
                Reset(datakamar);
                while not EOF(datakamar) do
                begin
                        readln(datakamar,tempKamar);
                        Assign(file_kamar,tempKamar);
                        Reset(file_kamar);
                        read(file_kamar,kamar);
                        Writeln('Jenis: ',kamar.jenis);
                        Writeln('Fasilitas: ',kamar.fasilitas);
                        Writeln('Harga: ',kamar.harga);
                        Writeln('Shift: ',kamar.jam);
                        Close(file_kamar);
                        Writeln;
                end;
                Close(datakamar);
                writeln('1. Deluxe Room, Harga: Rp 90.000,-/jam');
                writeln('2. Standart Room, Harga: Rp 70.000,-/jam');
                write('PILIH:'); readln(room);
                if room =1 then
                begin
                        room:=90000;
                        tipe:= 'Deluxe Room';
                end;
        if room =2 then
        begin
                room:=(70000);
                tipe:= 'Standart Room';
        end;
        writeln('anda memilih ruangan ',tipe, 'dengan harga Rp.',room);
        writeln('booking room selesai');
        readln;
        main_menu;

        end; }

        procedure menu_user;
        begin
                clrscr;
                //Assign(file_user,username);
                //Reset(file_user);
                //Read(file_user,user);
                writeln('+=====================+');
                writeln('|     Menu User       |');
                writeln('+=====================+');
                writeln('| 1. Info Ruangan     |');
                writeln('| 2. Booking Ruang    |');
                writeln('| 3. Log Booking      |');
                writeln('| 4. Log Out          |');
                writeln('+=====================+');
                writeln;
                write('Menu Pilihan: ');readln(answer);
                case answer of
                        '1': begin
                                dataroom;
                             end;
                        '2': begin
                                bookKam;
                             end;
                        '3': begin
                                log;
                             end;
                        '4':main_menu;
                end;
               // close(file_user);
        end;

        procedure login;
        begin
                clrscr;
                status:=false;
                writeln('+=====================================================+');
                writeln('|                   Menu Log In                       |');
                writeln('+=====================================================+');
                writeln;
                writeln('+=====================================================+');
                write('Masukkan Username           : ');readln(username);
                write('Masukkan Password           : ');readln(password);
                writeln('+=====================================================+');
                assign(datauser,'datauser.txt');
                reset(datauser);
                while (not EOF(datauser)) do
                begin
                        readln(datauser,tempuser);
                        if (username = tempuser) then
                                status:=true;
                end;
                Close(dataUser);
                if (status = true) then
                begin
                        Assign(file_user,username);
                        Reset(file_user);
                        read(file_user,user);
                        if (username = user.Username) and (password = user.Pass) then
                        begin
                                Writeln('Login Berhasil');
                                writeln('Selamat Datang!');
                                Close(file_user);
                                menu_user;
                        end
                        else
                        begin
                                writeln('Password Salah!');
                                close(file_user);
                                readln;
                                login;
                        end;
                end
                else
                begin
                        Writeln('Username Tidak Terdaftar, Silahkan Login Kembali!');
                        Readln;
                        Login;
                end;
        end;
        procedure data;
        var
                a:integer;
        begin
                clrscr;
                a:=0;
                Assign(datauser,'datauser.txt');
                Reset(datauser);
                while not EOF(datauser) do
                begin
                        a:=a+1;
                        readln(datauser,tempUser);
                        Assign(file_user,tempUser);
                        Reset(file_user);
                        read(file_user,user);
                        writeln;
                        writeln('=====Data User=====');
                        Writeln('Username: ',user.username);
                        Writeln('Nama: ',user.nama);
                        Writeln('Email: ',user.email);
                        Close(file_user);
                        Writeln;
                end;
                //writeln('room: ',user.room);
                Close(datauser);
                if a<1 then
                        begin
                                writeln('xxxxxxxxx Data User xxxxxxxxx');
                                writeln;
                                writeln('Tidak Ada Data yang Terdaftar');
                                writeln;
                                Writeln('Press Enter to Go Back');
                        end;
                Readln;
                menu_admin;
        end;
        procedure menu_admin;
        begin
                clrscr;
                writeln('+==========================+');
                writeln('|         Menu Admin       |');
                writeln('+==========================+');
                writeln('| 1. Data User             |');
                writeln('| 2. Hapus User            |');
                writeln('| 3. Input Ruangan Kosong  |');
                writeln('| 4. Hapus Ruangan         |');
                writeln('| 5. Konfirmasi Booking    |');
                writeln('| 6. Log Out               |');
                writeln('+==========================+');
                writeln;
                write ('Menu Pilihan: ');readln(answer);
                case answer of
                        '1':begin
                                data; //inputKamar;
                            end;
                        '2':begin
                                hapususer;
                            end;
                        '3':begin
                                inputkamar;
                            end;
                        '4':begin
                                hapusKamar;//dataroom;
                            end;
                        '5':begin
                               konfirmasipembayaran;
                            end;
                        '6':begin
                                main_menu;
                            end;

                end;
        end;


        procedure admin;
        begin
                clrscr;
                writeln;
                writeln('+==================================+');
                writeln('|  Masukkan Username dan Password  |');
                writeln('+==================================+');
                write('Username :');readln(usernameadmin);
                write('Password :');readln(password);
                if (usernameadmin='admin') and (password='admin') then
                        begin
                                 clrscr;
                                 writeln('+=====================================================+');
                                 writeln('|                     Menu Admin                      |');
                                 writeln('+=====================================================+');
                                 menu_admin;
                                 {writeln('1.Hapus Data/Akun Pendaftar');
                                 writeln('2.Konfirmasi Booking');
                                 write('Menu Pilihan: ');readln(answer);
                                 case answer of
                                 '1': begin
                                        write('Masukkan Username yang Akan di Hapus:');readln(answer);
                                        assign(file_user,answer);
                                        erase(file_user);
                                      end;
                                 end;}

                        end
                else
                        begin
                                writeln('Username atau Password Salah!');
                                answer:='';
                                readln;
                                admin;
                        end;
        end;

        procedure registrasi;
        begin
                clrscr;
                writeln('+=====================================================+');
                writeln('                   Menu Registrasi                    |');
                writeln('+=====================================================+');
                writeln;
                Assign(dataUser,'datauser.txt');
                Append(dataUser);
                writeln;
                write('  Masukkan Username            : ');readln(user.username);
                write('  Masukkan Password            : ');readln(user.pass);
                write('  Masukkan Nama                : ');readln(user.nama);
                write('  Masukkan email               : ');readln(user.email);
                writeln(datauser,user.username);
                close(datauser);
                writeln;
                assign(file_user,user.username);
                rewrite(file_user);
                write(file_user,user);
                close(file_user);
                writeln('Data yang Anda Input Sudah Terdaftar!');
                writeln;
                writeln('Press Enter to Go Back!');
                readln;
                main_menu;
        end;

        procedure welcome;
        begin
                clrscr;
                writeln('+==================================+');
                writeln('|          Selamat Datang          |');
                writeln('|                Di                |');
                writeln('|           Vine Karaoke           |');
                writeln('+==================================+');
        end;

        procedure main_menu;
        begin
                welcome;
                writeln;
                writeln('+==================================+');
                writeln('|            Menu Utama            |');
                writeln('+==================================+');
                writeln('| 1. Registrasi                    |');
                writeln('| 2. Log In                        |');
                writeln('| 3. Admin                         |');
                writeln('| 4. Info                          |');
                writeln('| 5. Keluar                        |');
               { writeln('| 4. Info                          |');}
                writeln('+==================================+');
                writeln;
                write  ('Masukkan Pilihan: ');readln(answer);
                case answer of
                        '1':registrasi;
                        '2':login;
                        '3':admin;
                        '4':info;
                        '5':begin
                            end;

                end;
        end;

        procedure info;
        begin
                clrscr;
                writeln('=======================================================');
                writeln('                          Info                         ');
                writeln('=======================================================');
                writeln;
                writeln('1. Room terdiri dari 2 Jenis, yaitu Deluxe dan Standard');
                writeln('2. Harga untuk Standard/Jam = Tiga Puluh Ribu Rupiah');
                writeln('3. Harga untuk Deluxe/Jam = Enam Puluh Ribu Rupiah');
                writeln;
                writeln('Press Enter to Go Back!');
                readln;
                main_menu;
        end;



Begin
        main_menu;
        //readln
end.
