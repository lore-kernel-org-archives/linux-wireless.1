Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.59.177.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219418;
	b=qDVSMjlmvbkPg2cPbvdZRcd/kAjHbaIHpgTSbAMhoIbsd3m6wHy2HtkCCSbPMS6Fw1gp
	 aRPPdXCg39NznV7ypw2XAeZps/3PGvZD2x5khkMn6rNPaZv7rjNtJSWOItKFX6hlqSfKa
	 wHWzzHia3w7PCdCiI1SAb63yHO48etkCHkuWKFpKBfkX9BrFDhNnfLWcFspd6Jtf83QVy
	 liGZZGK5eiOU8YdmRXRmTlvdE7KdjliQvfXGREpUgp9OLRkMf8Bngdrwt+CZ0dJ1nqdEJ
	 c4Iy75qPiN9KWMX158hearvzA3tE/CavLIlIioB+Kva5JCgBY+rnFJqmmnxE2LTAWPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219418;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version:X-QQ-SENDSIZE:
	 Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=D6K1Gh9ZwKuE/EF0fW4PMG/vMCUQBOTiZzCkJECMiEQ=;
	b=qHUpcz7mh+g60r86juv8IsurR3uPs3cTaJ9Q8E9BKHXlB8ADQkBGzVB+rKpCl4d+/neI
	 fkdwfXBNcQJKEjrmJuTnYwVqcvci4cwKwXmwKtmB9Tk6GshiziHsk6pa26VIuMiy83wVD
	 p3AG8xEV7ioP94YYA4k7V3dULjTMH1WIXj9xbwShDyIy75GFjKCXJjCREQwzvch83XtqL
	 UlfU8t1hBw9HPWoLD8IhTVnmQOsu96u6StT6wDW6N5M7TciN9fe2pqNd2bZRMTqjFskjR
	 aeIoTuM3UcjHkKd09psruHbPiGs7WNwKFSF5sKKK8dkpJqZPyBJLlM5o1Imi7kL5jfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=guwolf.com;
	spf=pass smtp.mailfrom=guwolf.com;
	arc=none smtp.remote-ip=52.59.177.22
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E6C606A330
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 10:16:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04E6C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=guwolf.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=guwolf.com
X-QQ-mid: zesmtpsz2t1794219391t2698d57a
X-QQ-Originating-IP: yB/YdOCLu7vWw3NPlM8gLD/vVpL+ms9Z6Av3h1wY9Ok=
Received: from [127.0.1.1] ( [111.55.209.194])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 09 Nov 2026 18:16:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2007918487820655683
From: Tan Hao <guwolf@guwolf.com>
To: linux-wireless@vger.kernel.org
Cc: Ping-Ke Shih <pkshih@realtek.com>
Subject: RTL8851BE: 5 GHz 80 MHz/HE beacon loss then auth timeout since 7.3
Date: Mon, 09 Nov 2026 18:16:30 +0800
Message-ID: <0A58E3B7800E469B+179421939016.46230.883154851683340495@guwolf.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:guwolf.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MpJmQ90V4eWU5VnvuUHAXavptc/kL1zpWaqqrsnCaIYrhDv42ZtbooaW
	2dmsVgyvBj7kWPA0j9Ut/HK1+H2VoJ5E2iEAXOfCkBewJQoqIxKHO1caw6o3TPCxhGo0abA
	TY9c4EoanB/SFTjSOxEFjngLduF4Flt5rC7hT8z/A1CDzkfsZc/AaZoOnKMVP5EWWRYMl/2
	IdqSkFxyHSibBAxh4/kx4Z92wwKXzSoL97nNfJd8x79+3eoGTeEmKIc/7vWKDsCjspE5pJy
	ipbG/eNcZJtwIsOMZJiuTx9XIrl1ULKDarwR2PzgftmquJGDyLmxasC7jFYuujldpyOc2+s
	d+V667MFGm8v0Cp2coYZVIaVLJYKbqKlRSexqKvBWNTe19qGne4Ie3G2IMj3X6XMS+Gigf0
	SfVtcffaXHJ674CtrYnjz42TMLefLQdy8vRFCE8RJULxbZWkIQXOe/ieGOKgG7HHvPSqhLD
	fdPTlKmZAA9K9unHfhc7x5YlSeQpN3rNkYJ35U015dA8/KnpvSiBQa90GcbS6uNMrJvFjCh
	1rOvyec5URvW7sRFGkzIOxyW9enSR1mCCZktXXjyVKyqBxTPeEDNa82oxHoAezh9fuDu6GH
	Hc9CI4hPzjUTFJXcA9ZsZMUNff2NjRSdElLUohTnmDQp6ZBqMM+FknVwZ9Zx/0sAuv5mCxG
	SLTnFqtYZfrt65ltigaKI92buBT9qV8uzEhUXSktqbVhk+jfXwmfsV9tkS/CyCMezG5eUaj
	IgIXjUgfu+zAiEDJJYslkvz3EatGOcP/icd8lQX6ynPBAv8k7BkldtTSRaT/uJCFYaNbyfu
	leRlfGGQeKJPq/jqd2e6rZ2HuyXPLh8qF06WU9g1XUorpmzlUja/a5K8poDQ97rINzG+/WI
	BriVEuKvhjYIBR2IvaU5HaEVORSechWlj6b8GY8z6cqZvhvRPzkpCTuYSTIMwYTuGtRbZCn
	JjvK6cb5lN5Ty3Ryop28AkJ5dm/0tOnoPMus=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

Hi,

On RTL8851BE, 5 GHz 80 MHz/HE association succeeds, then the STA
loses beacons within about one second. After that, every 5 GHz
authentication times out until rtw89_8851be is unloaded. 2.4 GHz
and 5 GHz HT20/HT40 stay up. This started in 7.3.0; 7.2.11 is fine
with the same firmware file.

I am still bisecting. This is a report only, no patch yet.


Hardware
--------

  Laptop: Acer S16-41L (AMD Phoenix)
  PCI:    02:00.0 Network controller [0280]: Realtek RTL8851BE [10ec:b851]
  Driver: rtw89_8851be
  Chip:   CID 0, CV 1, AID 0, ACV 0, RFE 5
  FW:     rtw89/rtw8851b_fw-1.bin  0.29.41.5 (4bd6ebac)
  linux-firmware-realtek 20261019

  Both the working 7.2.11 kernel and the failing 7.3.x kernels load
  this same fw-1.bin (format 1). 6.18 LTS still requests the older
  rtw8851b_fw.bin; I have not used LTS as the primary comparison.

  Module parameters already set (do not avoid the failure):

    rtw89_core.disable_ps_mode=3DY
    rtw89_pci.disable_aspm_l1=3DY
    rtw89_pci.disable_aspm_l1ss=3DY
    rtw89_pci.disable_clkreq=3DY

  Regulatory: country CN, DFS-FCC. Channel 149 is allowed (33 dBm).
  SER L0/L1 counters stay 0; fw_crash is 0.


Kernels

  Good: 7.2.11 (CachyOS bore-lto, rtw89 from 7.2)
  Bad:  7.3.0 and 7.3.3 (CachyOS, rtw89 from 7.3)
  User-space: NetworkManager 1.58 + wpa_supplicant 2.12, nl80211


APs (same room, RSSI typically -30..-50 dBm)

  Dual-band SSID "GuWolf":
    5 GHz  BSSID 1e:40:e8:12:08:63  5745 MHz ch149  HE80  ~1170 Mbit  WPA2/WP=
A3 SAE
    2.4 GHz BSSID 1e:40:e8:12:08:62  2462 MHz ch11   HT40  WPA2/WPA3 SAE

  5 GHz-only SSID "UINT_MAX":
    BSSID 4e:69:b1:c6:62:64  5745 MHz ch149  HE80  WPA2-PSK

  On 7.2, UINT_MAX also worked on UNII-1 (5220/5240) and after a CSA
  to 5745 MHz / 80 MHz. So this is not limited to a single AP.


Reproducer

  1. Boot 7.3.x with the stock rtw89 driver (do not mask HE/VHT).
  2. Connect to either 5 GHz BSSID above (SAE or PSK, same result).
  3. Association completes; beacons are lost ~1s later.
  4. Re-auth to any 5 GHz AP times out. 2.4 GHz still works.
  5. Recovery: modprobe -r rtw89_8851be rtw89_8851b rtw89_pci rtw89_core
     && modprobe rtw89_8851be
     The next 5 GHz attempt can associate once, then the same loss
     repeats.


Logs (7.3.3, GuWolf 5 GHz, typical)

  wlan0: authenticate with 1e:40:e8:12:08:63
  wlan0: send auth to 1e:40:e8:12:08:63 (try 1/3)
  wlan0: authenticated
  wlan0: associate with 1e:40:e8:12:08:63
  wlan0: RX AssocResp from 1e:40:e8:12:08:63 (capab=3D0x11 status=3D0 aid=3D2)
  wlan0: associated

  wpa_supplicant:
    Associated with 1e:40:e8:12:08:63
    CTRL-EVENT-BEACON-LOSS
    CTRL-EVENT-DISCONNECTED bssid=3D1e:40:e8:12:08:63 reason=3D4 locally_gene=
rated=3D1

  Then:

  wlan0: send auth to 1e:40:e8:12:08:63 (try 1/3)
  wlan0: send auth to 1e:40:e8:12:08:63 (try 2/3)
  wlan0: send auth to 1e:40:e8:12:08:63 (try 3/3)
  wlan0: authentication with 1e:40:e8:12:08:63 timed out

  UINT_MAX (WPA2-PSK) is the same pattern; one run associated, then:

    CTRL-EVENT-BEACON-LOSS
    (no 4-way completion)

  After a module reload, UINT_MAX associated again and wpa_supplicant
  completed the 4-way, then lost beacons ~1s later in other runs.

  Scan still lists the 5 GHz BSS at full signal while auth TX fails,
  so 5 GHz RX of beacons during scan works; 5 GHz TX after the failed
  80 MHz session does not, until reload.


What does not fix it

  - disable_ps_mode / disable_aspm_l1 / disable_aspm_l1ss / disable_clkreq
  - NetworkManager wifi.powersave=3D2, scan-rand-mac-address=3Dno
  - Raising mac80211.beacon_loss_count from 7 to 80: disconnect
    delayed from ~1s to ~9s, still zero beacons in that window
  - Reloading without actually resetting the 5 GHz PHY (just
    reconnect) is not enough once the first 80 MHz session has died


What does work on the same 7.3.3 kernel

  Forcing HT-only (wpa_supplicant disable_he=3D1 disable_vht=3D1), so the
  AP falls back to HT20/HT40 on 5745 MHz:

    wlan0: AP 4e:69:b1:c6:62:64 changed bandwidth in assoc response,
           new used config is 5745.000 MHz, width 1 (5745.000/0 MHz)
    WPA: Key negotiation completed
    iw: HT40 MCS 7, ~150 Mbit/s, beacon loss 0, DHCP OK

  Both SSIDs stay up this way. I am using that only as a local
  workaround, not as a proposed driver change.


Firmware elements on 7.3.3

  Firmware element BB version: 00 17 00 00
  Firmware element radio A version: 00 28 00 00
  Firmware element NCTL version: 00 0b 00 00
  Firmware element TXPWR version: 00 48 00 00
  Firmware element PWR_TRK version: 00 22 00 00
  Firmware element REGD version: 00 49 00 06


I can capture rtw89 debug_mask traces comparing a working HT40
session with a failing HE80 session, and I can test patches on this
RTL8851BE. Please tell me which debug bits you want.

Thanks,
Tan Hao
