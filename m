Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903442;
	b=allT8IHgxXMOut+WnT8JAdE6WdvBgr24Xk5tbrKg15KVHZGh7BvrznkcxO7MRpaz06F5
	 rcVQ1rZFPI4DZHxWzTBeiUfZNUEHXxemHhME5+CJR9wiLxLyyba3C4m0vKsitLe4hAXc5
	 KJCAqebkpOZzPqltzPUKaZa3AksYDzvcYNCr7lzcfeZq8urydyns9ktMFwZQYQyzv8C1G
	 gabI2z+egxz2ct8MI6phLPWhtA8dXVr6MsdNVJxx5avvood2r98PWXmj/q5E/oIZP+boG
	 jJNn96PWdC/QwDEhlMYkzx2Q1UBStRw/fqeK/NWe4BMaIDxq8+1eYMRs9bNSxF7ZsOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903442;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:In-Reply-To:References:
	 Message-ID:Date:MIME-Version:Content-Type;
	bh=0sp8hDHn32Vt5n3+M5IvNTbz3A68S6+DN8S2U19OeQw=;
	b=DuOEAapYoGX1t5Iot86k42vtb5wctJ2w/MCXAI7MSExxD4GY2zro1bYH9pZspjKdoC+K
	 M6cJm7dF1zxeFAzfTD603CpAGejX2Aqv3qPiqZSC0cC4C5kU547+S5+H97BY3HGKsLDjH
	 YH/AJDITwefZd5O/2ZIzRgxpnW5FTQoWJvKEbSm/I+i2oeXSZ4p1nF1M+ZeGWKAgwTBI3
	 bVFvy/8TnX6xKCnshwOiw/rdMrO5uWSN2Xa0CU6HH2Af1e7rSR3eLYTuJzjK1kz8i9Ahg
	 l/gVf+1js6hOwvs6dmvPWdrX62eF9M0g62gdf3US9bZsyetFrQBxAgO5h6/NGRpImNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=pkE2+I5+;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE5D606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 08:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AE5D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=pkE2+I5+
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH8HFXJ0081087, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794903435; bh=0sp8hDHn32Vt5n3+M5IvNTbz3A68S6+DN8S2U19OeQw=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	b=pkE2+I5+HapkpyHAE34ZZ+BnYjw4eE8dE9CcVvuDXkLaZpoc5qzm0noZ4mhzMH2Tf
	 Ng4Rz2anXQ5sI5UFA6xqjIWYt7R2e6YqV8N2SoG8Q0J33YMNuQIoVU75PYiJVqlvYl
	 Ze5rHABrIM1/xXhwTIp+SvySR78c5UiBxMFHIVRZLEVWhBTc+WrWjVcTd9oRvapyZa
	 CoJeNFXw9PHYY7E3iZiyxvWykWMBbfyUJYl1oLFOzFIvdi6rzQ52pkLgovvA3CNPhI
	 ywVKzOZoRUtWNO6Ae3bREvlNTA6DwmAQrCF62BD6zAuM4kAt/HGi+hNNTSBP4benuW
	 GCagRDnSlN+rQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH8HFXJ0081087
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 16:17:15 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 16:17:15 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 16:17:13 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Tue, 17 Nov 2026 16:17:08 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Vincent Schurink <spam@acio.nl>, Ping-Ke Shih <pkshih@realtek.com>
CC: <linux-wireless@vger.kernel.org>, Vincent Schurink <spam@acio.nl>
Subject: Re: [PATCH rtw-next v5] wifi: rtw89: set RA init rate level when the station RSSI is known
In-Reply-To: <20261116085534.66746-1-spam@acio.nl>
References: <20261116085534.66746-1-spam@acio.nl>
Message-ID: <8259119d-c99f-44b7-8eea-91b44c016523@RTKEXHMBS06.realtek.com.tw>
Date: Tue, 17 Nov 2026 16:17:08 +0800
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Vincent Schurink <spam@acio.nl> wrote:

> When a station associates to an AP, the AP does not know the RSSI of
> the station yet. Thus, rtw89_phy_ra_assoc() sends init_rate_lv 0 to the
> firmware. With this value, the firmware RA of RTL8922A often uses 20 MHz
> and VHT-MCS 2 for the station. It does not try a higher rate, also when
> the PER is 0. On an 80 MHz AP, the TCP throughput to the station
> then stays at approximately 36 Mbit/s for the full connection.
> 
> Move the mapping from RSSI to init_rate_lv to a function. In a test on
> RTL8922A, the firmware used init_rate_lv only together with upd_all, and
> upd_all resets the RA context. Thus, the RA association sets
> rssi_unknown in the RA info when the RSSI is not known. When the RSSI is
> known, the RA update sets init_rate_lv and upd_all one time. Other RA
> updates still send init_rate_lv 0.
> The flag is in a struct_group at the end of the RA info, and
> rtw89_phy_ra_sta_update() clears the RA info only up to this group.
> Thus, the flag stays until the RA update uses it.
> 
> Tested on RTL8912AU (RTL8922A, USB) in AP mode with hostapd 2.10 and
> VHT 80 MHz. The client is an Intel Meteor Lake CNVi (iwlwifi) at -34 to
> -40 dBm. Each test reconnects the client, then sends TCP from the AP for
> 60 s.
> Before: 6 of 8 connections stay at VHT-MCS 2 and 20 MHz, 36 Mbit/s.
> After: 8 of 8 connections use VHT-MCS 9 at 80 MHz, 671 to 683 Mbit/s.
> 
> Suggested-by: Ping-Ke Shih <pkshih@realtek.com>
> Signed-off-by: Vincent Schurink <spam@acio.nl>
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>

1 patch(es) applied to rtw-next branch of rtw.git, thanks.

154d3668b645 wifi: rtw89: set RA init rate level when the station RSSI is known

---
https://github.com/pkshih/rtw.git

