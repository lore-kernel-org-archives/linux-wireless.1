Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795566828;
	b=HOLyIRuhnmaM0J/HZCwpeIIyhswGs5futW+1Lc3k+5mTJ+QHjoZ0Xfsv3NgTLVbTn98v
	 hTqMVPVGJ4Uckw4s5BSw2IPVWrWVJeHcKrBNDGJCuWM74olqboH9MXKEcRBijIRvVO5xB
	 zVTtGERSWR9MRfdo4TbpPw7em8pIaduOg8dUPyGOhabfoKzM8wu3qYVDnqh/b5YHu/CiF
	 d6dHDcwBYC1jzifUeXMdIRlBrNluDL7chXQ44PogM/bBPokGx09ZtccIfrNOOqCOrbCQT
	 ZqXEPVnXBZZyF2UU0ULDxuUY2oT80m4TJJU5r52sf5htbBMbe9V1wStAORfPHZL0Evw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795566828;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=AHDXFQRW6RZ9DyfNwBs9t7YMiEjWMiLny3Au5CMBuzo=;
	b=iohAqKwJRNcItu+gogS8cq/6ZvI8v0yI6LwBIr/jhDChrLy6D0mRDQ3ueuk9dqXv/qMd
	 h6i2W5fC6Z4+5ufAPGuq98BvEL0bdSHVEk2twElgRhyD2Fk9Ot5ZF1NNzwHDIBxN4hu5n
	 U4yn86zDxiqmfKMVcrbRP+Mgz36zU//j/yH2RnkD3gdwKSDhV1OMSKanWgaemCQ1PExIB
	 A+8C1PmP7OETeKlAOtTGgKpWxAW+2bxGfWHaLJSEz0Is1ZC/yq34p+JduG3eMh55c55tQ
	 YrBj9t7b17OHrJiA97AjTnzQdxiUJWjcJSCpvVpL+ocNGQWQ/eKVIZjt/GkJbz0YaFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=vprgdnEb;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC9D606A31E
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 00:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CC9D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=vprgdnEb
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AP0XhFzA2977745, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795566823; bh=AHDXFQRW6RZ9DyfNwBs9t7YMiEjWMiLny3Au5CMBuzo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=vprgdnEbVw+SCoiIAb0R4zSbrq3wRWGYuzFwyNeg56XrqoDZuEeKL3+A42Q4+c+VA
	 QlMGtU+pu6Jzflm0ckz5CgxSCxzQqGESLSPZOIr4bmVYLGE5AZq8osN8VXdhlguYZY
	 cWlLBTjn08BjG6r47bNF7zKiR/Nn4BhciFc8Eu3OuRgAiQ1o6CIiLDZtTIk+tbeCsC
	 Fg5b14BtZTAdqPAIj/7GwTdex6gZWs1uOI+nMWvRv3vbbIHFuZYW8J8Uv589/JdTLz
	 C051c5TfevoFx3JRKVZwGJHJy9dNkC9q8Xp8tZhKcuZsxmi9K/wrQQVQNQbqyPHlkU
	 deMar6HEiaTOg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AP0XhFzA2977745
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 08:33:43 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 08:33:44 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 08:33:43 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Wed, 25 Nov 2026 08:33:43 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: <linux-wireless@vger.kernel.org>
Subject: [PATCH rtw-next] MAINTAINERS: add a generic entry for Realtek WiFi drivers
Date: Wed, 25 Nov 2026 08:33:24 +0800
Message-ID: <20261125003324.6951-1-pkshih@realtek.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add myself to manage all the Realtek WiFi drivers.
Since RTL8180 and RTL8187 are not active, keep the status as Orphan.

Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>
---
 MAINTAINERS | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7336600952c8..b4d38990a7da 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23153,6 +23153,13 @@ M:	Hao-Wen Ting <haowen.ting@realtek.com>
 S:	Maintained
 F:	drivers/clocksource/timer-realtek.c
 
+REALTEK WIRELESS DRIVER (generic)
+M:	Ping-Ke Shih <pkshih@realtek.com>
+L:	linux-wireless@vger.kernel.org
+S:	Maintained
+T:	git https://github.com/pkshih/rtw.git
+F:	drivers/net/wireless/realtek/
+
 REALTEK WIRELESS DRIVER (rtlwifi family)
 M:	Ping-Ke Shih <pkshih@realtek.com>
 L:	linux-wireless@vger.kernel.org
@@ -24063,12 +24070,12 @@ F:	drivers/media/dvb-frontends/rtl2832_sdr*
 RTL8180 WIRELESS DRIVER
 L:	linux-wireless@vger.kernel.org
 S:	Orphan
+T:	git https://github.com/pkshih/rtw.git
 F:	drivers/net/wireless/realtek/rtl818x/rtl8180/
 
 RTL8187 WIRELESS DRIVER
-M:	Hin-Tak Leung <hintak.leung@gmail.com>
 L:	linux-wireless@vger.kernel.org
-S:	Maintained
+S:	Orphan
 T:	git https://github.com/pkshih/rtw.git
 F:	drivers/net/wireless/realtek/rtl818x/rtl8187/
 
-- 
2.53.0

