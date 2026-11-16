Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820664;
	b=oQRL9MOHyA8Myw2eK4x2k3ZNufXgYzP54xDhl6AcON2aZDo13ddoWqYmcQ48Mz4vgAZu
	 TlV4Omz63J/Zpenwbp7F5FrltKNfe+X7xUPJ8Q5k86SOXXhFhF3ucNuGgmf8QykKWcFTa
	 BTNFxqPCGLtPk1uSbEnEZZp5yryrjuGlf8U4fEz71YSovtf6ce52QgbFihJj+PHpziwSh
	 TlvHZXhnua3j38K+RVt15Lp+MAibR+l2LpG5u9jn8H0kdmiHF42nxM1UxE13cbI8fYEZY
	 01jV4IZarCYMR8OS1DtabIql94HyhTd8HZpvrMvHmYfVJUOjJnsav/5iTVky0uptMaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820664;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=W1ID0KUmiJ0hJt1hSYwPJknYkkXTw1HPu1FxKo7PFK0=;
	b=tVIDGPGC/fT/idbHJP3zHWZ7mrh3Ow6We0MB0VY6vu5wgtZS21s0zBkBlmdvLG4pzjdv
	 hbmJbpQNlylCSQN7QhZ5tzyGqg93RBgj43FTbHgRe9r6ZsxsfzrDp6U6LUdGVniU3bwnQ
	 D+5LxV/XvZQqIv1hBGWIbJujFyq8zI1ILsRwtZEfPoUlu+Vzh6B6Ddl9qO0LIXoWZmhtg
	 D3KfxetbR1alq8dXGQnv+prHfEkLPot0sRuN2z3FQeBlEGXnvY8EopSHWr/osA/IxfBeo
	 WQQJR3nJQF/bMcEyb28bwvoXLS1oMiUj0J8SncZxk/rZSQGWLxOEVSf3CSGM7H60b2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=iJ4nljKd;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E2A606A337
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 09:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18E2A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=iJ4nljKd
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AG9HaPqA3285774, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794820657; bh=W1ID0KUmiJ0hJt1hSYwPJknYkkXTw1HPu1FxKo7PFK0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=iJ4nljKd8GHo0U7FDxd29RgwOE95FbOIohtwxiKWrOJA8KViP3WN6T5uOAs2UutLL
	 g6PTsvEVT5ym+fmGRTU9VcsTAAZlr2PBbNv3Q4rdVQbG/1wav+yiYUax/XtQqh+K2O
	 R+cRAthKC/JZ1Z1GD4aeXbitZic79yRPKsB2QeNpD4L61lMcy++g7CZ+j1EqNXiLry
	 TlcPah/5/isBVWwLlD37F1dfAxCq8kKFaWF1911JWQOGRRi2o/4yjZpitfg/yjlKgg
	 UvsvguEOUeB/Sse4M2qTlSfZU+oq/WYUtwAZn3sFIF51a7yDQkA/kTXPtPW6nylDbi
	 kaEW5B718/dzg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AG9HaPqA3285774
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Nov 2026 17:17:36 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 17:17:37 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 16 Nov 2026 17:17:37 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Vincent Schurink <spam@acio.nl>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH rtw-next v5] wifi: rtw89: set RA init rate level when the
 station RSSI is known
Thread-Topic: [PATCH rtw-next v5] wifi: rtw89: set RA init rate level when the
 station RSSI is known
Thread-Index: AQHddahadC2LlAQx70epkOwGpneDyrcwazrg
Date: Mon, 16 Nov 2026 09:17:37 +0000
Message-ID: <96354bbc054c46f9b9546a19d3037566@realtek.com>
References: <20261116085534.66746-1-spam@acio.nl>
In-Reply-To: <20261116085534.66746-1-spam@acio.nl>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="us-ascii"
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

Vincent Schurink <spam@acio.nl> wrote:
> When a station associates to an AP, the AP does not know the RSSI of
> the station yet. Thus, rtw89_phy_ra_assoc() sends init_rate_lv 0 to the
> firmware. With this value, the firmware RA of RTL8922A often uses 20 MHz
> and VHT-MCS 2 for the station. It does not try a higher rate, also when
> the PER is 0. On an 80 MHz AP, the TCP throughput to the station
> then stays at approximately 36 Mbit/s for the full connection.
>=20
> Move the mapping from RSSI to init_rate_lv to a function. In a test on
> RTL8922A, the firmware used init_rate_lv only together with upd_all, and
> upd_all resets the RA context. Thus, the RA association sets
> rssi_unknown in the RA info when the RSSI is not known. When the RSSI is
> known, the RA update sets init_rate_lv and upd_all one time. Other RA
> updates still send init_rate_lv 0.
> The flag is in a struct_group at the end of the RA info, and
> rtw89_phy_ra_sta_update() clears the RA info only up to this group.
> Thus, the flag stays until the RA update uses it.
>=20
> Tested on RTL8912AU (RTL8922A, USB) in AP mode with hostapd 2.10 and
> VHT 80 MHz. The client is an Intel Meteor Lake CNVi (iwlwifi) at -34 to
> -40 dBm. Each test reconnects the client, then sends TCP from the AP for
> 60 s.
> Before: 6 of 8 connections stay at VHT-MCS 2 and 20 MHz, 36 Mbit/s.
> After: 8 of 8 connections use VHT-MCS 9 at 80 MHz, 671 to 683 Mbit/s.
>=20
> Suggested-by: Ping-Ke Shih <pkshih@realtek.com>
> Signed-off-by: Vincent Schurink <spam@acio.nl>

Acked-by: Ping-Ke Shih <pkshih@realtek.com>

