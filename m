Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794137555;
	b=pe9kgqdpVUlQqQiVJMt8/TtSw8DTEihfkyKa55dHFFf+suvb2kdlsNcpFzkiOTrZEU+D
	 qcacwywxVnSeHanQCXGIP1NYJmC/F5QxqNGrYJ2A7c6VAdTfrQzs/9Y7Xah1trNPS28jD
	 2Ia6mesSbBDZHMUQhZPzsWHHp/36FG6MJct0vMcywDLVEWb0aqyjQfU5haw5B5kgJPNvS
	 DS8XJHGxeCL4RLSi8VK80axHX/B5Iyf+fJm3AdOM7V5gKbr5BHUkUqA7tXFhOjOp9EzlP
	 DpliNsqzo5G+1MCiQ23m5+JtcYJnLtU5XmTTy8jbmRbPn6lTwK0IKva5+5faGdmfi1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794137555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=kp9abeUU5+s9kY9SMidpozMGFK90+3UhCB8qw3e5hKc=;
	b=mBDHhfq9H1YxrpxKxlx9xXQDZ124aVHSlKG+lsW8bG5DTOM4/QffJTCz9Rl4a3CgySJ6
	 WrxFIZ2vdw+TQq/BW+ZDNwUEmaJyhhrfuztEBA61X3XqwhyDwChgeU3wvWARQKAq2VPOK
	 ZhT4EoAkXRbUN2YWoHOSG4dHU57usS9rMADpsy/g40XZA8vJOLmb6b6ILoaoq1/kOUB+D
	 hu2/AIxP3OU+q6qJe4GNKzcd1fFZRZGNGK78w3mgdM3zn72F31em+4hyTT8OrfntIk1Ip
	 QZnc8G6lClTH7CSJJv/g2QUpyfUImGViqJr39C8OX5uyhp+V5roWouBByByANrtMUWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=duPgv5GL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7AE606A31C
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 11:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E7AE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=duPgv5GL
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b0dba37a7fso155607b3.0
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 03:32:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794137554; cv=none;
        d=google.com; s=arc-20260327;
        b=AqXJ2zjPnLb2LGKYqeA+SemGXl9jm85lyK+2znHoIlY2mVtiVIXfqnebPxWGkCXIkA
         hb9pNM7DnJILN3ncEEEqvWVnKdVlLDEr2TLJMDpFAFdeFv2wijtVQKt+cfsO3+gFVZ2f
         rhgArXi4M2pTWoZth5jLNxknleTQ1hga0oNy97BRQgwaKt/WkYRdXVqivP4AvpsXD2tq
         6gEpilMP4v19ZMmjTIScf47wbwov5Wd4DNtZa/49dic/usp+pdwKs3Y/g6vrtlvL21Zx
         NqZGYOJOKT8Q9t3QyNDHStYfCW44Qi3Q3T4cDuHIF2Zg/GsFFnVam/RY6yuXk29eKEcR
         3iWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=kp9abeUU5+s9kY9SMidpozMGFK90+3UhCB8qw3e5hKc=;
        fh=g4qIvl6/31HtnerxyVK37f4FNVcorEF6JuBH5wiMpis=;
        b=ngdHmvJBMZiCpzEcNXm925xCJOdWKMz/PO9MejP3rBC2lPxBvttMMh//0f1FXq0KJ2
         JaCrzcf1dGJtcPa8M2L5XKvumU+CCXi/eq0Hj0urfuPKRg8/sLyOjWxn2ZT3t4bx0VJJ
         cx0WtmMETWtNCdawSLPgmPRj4u/Rq66i4/KxYoThg0f3bDvoI1Sb/N+FNSejlvOXzPoZ
         Jr+hR8AsEhWRsfgywGhrBppACpKB/L0VqkK8yw+GvYrWHFrg+Ub2khbaa+MyOswX0D0a
         A+gP52awzjo+zHW0zLeL5IipfAn6B6ls1D6o9zfqJvG6y3jMjl6Usp3ujpnH01h3l5fe
         jVZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794137554; x=1794742354; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kp9abeUU5+s9kY9SMidpozMGFK90+3UhCB8qw3e5hKc=;
        b=duPgv5GLnYQuN9UNCLyx0AVPCJJ/UaARMe19COBKQWwHj6K2rFbfBdtA5Cnf2O8m2l
         Pgw8fG6T00aQyPRdtUMOD9L5XBZ17gymBeXXrWMtcRwWnx5jjQZAE39U+1/OreBWUM9d
         k9mh7O4pppmQbCF5XeG7Le0S7ZJRA4pNNMTj5cxOXq3JNZbc/TiHFiJe7E5d/AaUYqhN
         n3eANPdHZzhbxe/2/APFnppWqT6F++CvNW/53kRINPPxtZQwFoS4SJXoKotMHr7wnOPR
         GC/vuatFuCpSbYLtSj126JDbJ+hO1z9wn11yMWF6zREcLO+YNGfeykcw1egDg3F+RAly
         jnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794137554; x=1794742354;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kp9abeUU5+s9kY9SMidpozMGFK90+3UhCB8qw3e5hKc=;
        b=TkZVZN0PpyVaBDWG+Luq9XsJFuxEzbXAR/OUx/Ip2ZFiLEcZH86LnAROZlbPpb0KbR
         VZgNSE6MVyRxUgGCvOAMUFglFGlHwSJASLRC3zl2Qekk+oZ8qYZMaB7S3UPgOw9yJI24
         EqlpjuEWcd3Meqa3vib4Afbv1NaK2fS3vDYP8Wl5NtKdbXC0qGBHu201NUHhwZaxaqph
         tDfAUngbykrjNljIvY1cWhFXjrzcDHCKC0i4p6Cb79LG2eW2sL21c79ZzZ53B+8DYq1V
         v7sns4oNTV1dNMvhPiGIs9O4kSo1b8gwtgfXTmT0W+XAD67v2aQ9pZyXxIuEwsZLJU0O
         VLsg==
X-Gm-Message-State: APuU4Z9+5gGNUJJaZLntRNFS8qFXUkW7RYTFbJDbLnXmwq867QdN21Np
	wyB+bqYAEKZhfuBmpfdyqvyVsGShH7vEocyZKAiiL5dclDyrePED1xQ2rgyVXdsPqq1+HBdkOLw
	TsiWsIYUGKDUqhOD9n1+HUw4rl1nIiGtZMdrAGEQ=
X-Gm-Gg: AYBFou2nm76P94w4soc1LGjRqq8UcYobJn4xzTl5NMCfE3uPqbv9MRWUYa2h8CRXZVi
	tv6AJRfJXVGVSr5BmZwtZ/Ep75smndWdRWC/2ozMX3D2Y3VEo3IFdDt5irVlOJA8s8EsWsdJgtY
	gsBdC3VSdNbvhMYsQBLyschxMs+/h3cIGNDlhAQ8TnQVvjuiCXB0zWoMjZRWqhAM88YCGhqR9wq
	oG9a6lD31AiWCR6ASp17w5QeRLmrYXT0qEvCccn74Wi7kZwZqRKnoSb7nJ8bLik8R9dreVxbIE9
	a6a0DynCECmcx/xCfZwJ/w5hL/EJ4hYlu0/1JKb9bKzArgvog3VSf0zc96k/8RprItlG0aBlQzD
	8jXOEf4uQnob91xSabUu9PvHyCkYcH/E5p2JqYiUvBc1HQDbezdemmetThlRuZIZ/QGIEsIm3Tj
	t++0NJ1zCNuFKTOjjghBKkJ7AvWfGz+JgUdxj25S2VvM22i1a/nFCV4553pHVw7Y5h1JBv9TS47
	qYpMyK6QhRxKM05FkPb7r8wuWGYAjIKVsPicL2S4VsFj8DLWQ==
X-Received: by 2002:a05:690e:441c:b0:675:690e:e6a1 with SMTP id
 956f58d0204a3-67c3da43d84mr419973d50.120.1794137554023; Sun, 08 Nov 2026
 03:32:34 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: BrNcO BrNkO <brnco925@gmail.com>
Date: Sun, 8 Nov 2026 11:32:22 +0000
X-Gm-Features: AclHuK9xoqMZFrL3w1IM-afkxh4IiWHvfeYfb9G1gcwwRmRem3rGaAWH8P-p0LU
Message-ID: <CAD8w8XJuPc0mDtLnOb3MfwKJeC9t9UU0dsNoHVH=azzbKxBWyg@mail.gmail.com>
Subject: rtw89: 8852cu: no data TX under firmware RA at 6 GHz 160 MHz (fixed
 rate works)
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ping-Ke,

I would like to report a problem with RTL8852CU in station mode on
6 GHz with a 160 MHz BSS. I hope the details below are useful.

The adapter is the Valve Steam Frame wireless adapter (USB 28de:2432).
When it joins a 6 GHz 160 MHz BSS, it does not transmit any data
frames while rate selection is left to firmware RA. The 4-way
handshake times out because EAPOL 2/4 never goes on air. Management
frames go out normally. The same adapter with the same AP works at
160 MHz on Windows (Valve driver rtwlanuval.sys 5.32.908.2026).

Setup
-----
- Host: Fedora 44 based distribution (Nobara), kernel 7.3.1.
  Tested with the in-tree rtw89 and with morrownr/rtw89 (8019af4).
  USB 3 (5 Gbps), RFE 1, CV 1.
- Firmware: rtw8852c_fw-2.bin 0.27.129.4. Same result with 0.29.123.4,
  which I took from the Windows driver and repacked into an MFW
  container.
- AP: Qualcomm ath12k (WCN7850), hostapd 2.11. 6 GHz channel 37,
  160 MHz (center 6185 MHz, op_class 134), HE + EHT, SAE only,
  PMF required, country IE (ETSI), AP power type VLP.
- Signal at the AP is about -50 dBm.

What happens (EAPOL 2/4 as an example)
--------------------------------------
- mac80211 hands the frame to the driver. The TXQ stats show it
  leaving TID 7.
- The TX descriptor is normal: qsel VO (3), ch_dma ACH0, use_rate=0,
  bk=1.
- Nothing appears on air. A monitor on the same channel sees our
  SAE/assoc frames and the AP's M1, but no RTS or data from us.
  hostapd on the AP never receives 2/4.
- After several seconds the control-port TX status returns ack=0,
  and the AP deauthenticates with reason 15.

Isolation (one change per test)
-------------------------------
1. 6 GHz BSS at 80 MHz (AP switched with chan_switch, or STA without
   HE160 capability): works.
2. 5 GHz BSS at 160 MHz with the same adapter: works.
3. 6 GHz 160 MHz with a fixed rate in the TX descriptor (use_rate=1,
   dis_data_fb=1): works for OFDM6/20, HE NSS1 MCS0 at 20/40/80/160,
   HE NSS2 MCS0 at 80/160, and HE NSS2 MCS2/MCS4 at 160. The handshake
   completes and ping to the AP works. MCS7 and above at 160, and
   MCS9 at 80, are not decoded by this AP. I believe that is link
   budget; Windows also tops out around HE160 MCS6 here.
4. 6 GHz 160 MHz with firmware RA: fails in every variant I tried.
   The H2C RA MACID_CFG is identical to the working 80 MHz case
   except bw_cap 3 instead of 2.
   - ra_mask limited to HE NSS1 MCS0-4: fails.
   - ra_mask with HE NSS1 MCS0 only: the handshake sometimes passes,
     then ping fails.
   - ss_num 0, er_cap 0, dcm_cap 0, fix_giltf_en 0, init_rate_lv 1..3,
     CSI enabled: all fail.
   - CMAC DISDATAFB=0, DISRTSFB=0, RTS_EN=1, HW_RTS_EN=1: all fail.
     Even with RTS enabled, no RTS appears on air.
   - ra_mask with OFDM only (0xff0) at bw_cap 3: works.
   - bw_cap forced to 2 while the channel stays at 160 MHz: works.
5. TX power limits for this channel are non-zero and equal for 80 and
   160 MHz: MCS_1TX_160M 7 dBm, MCS_2TX_160M 4 dBm, reg6_pwr_type 0.

So firmware RA appears to never schedule HE PPDUs for a macid with
bw_cap=160 on 6 GHz in this configuration, while fixed-rate HE 160
frames are transmitted fine. I could not find which host-side
setting differs from what the Windows driver programs.

As a local workaround I stopped advertising HE 160 MHz on 6 GHz for
USB devices, so the adapter associates at 80 MHz. I can send that
patch if it helps, but it only hides the problem.

Is there a 6 GHz / 160 MHz RA prerequisite that the Linux driver does
not send for 8852C over USB, for example a per-band H2C or a CMAC/BB
setting? I am happy to run further tests (debug_mask output,
additional H2C/C2H fields, register dumps, captures) and to test any
patches you send.

Thank you for your time and for your work on rtw89.

Best regards,
BrNcO
