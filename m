Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794463616;
	b=rfMgxqI0v9XWXj+Vu5LuQH++d/4A/fZK5xbnhNiqyX8H+mpZMCzhHI4mG7kXUVruG3N1
	 74h6jejZfnDzgebE9ZdICH3o2+NLzaldU8NvPnqhEL88oRkH9UqWkTcZ7YJrq2tD/XvjG
	 WUzMk2rVk7ELDSN8KE7UV8jRuQ+ml+bQTpFa+PK3ewDAYYiUm3qxM3V7A8+QuwcNb8RyC
	 ZMQcktExtPO8jkK9Wonpn9ilIAUCQpi7gAd6P5xwIluOMd533sNDir9b60QHmO25GMmfI
	 FaZkA/HRvr5i7XoZZAhVrRytVNXrkXIGehVRpXO6Xqn2/+CgLH4Zze45RvC/DOVqV7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794463616;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=uq9viipXIbedIQVF1QBORHp4W5G9VrkzQMii6JWr5ZY=;
	b=LOntGi6oje1NwW4vY/iZvsL94uXI7EtbIOdrGGm1Hj/xh2ofoO6FP/uRkYNqDDShLHcf
	 ymWn9jmeGvgrHmW3+MgB9xAFXSrPEQnYAJakaCiBf9vtSAnZCCyQh9nQnwzqNArHRoTgE
	 FYhIwLgFrmoLl9UcEV3DRndLKQTUm9Ru8DMOyb4eIdZx8/epcGviJ1/2AXWWtweFBi7ea
	 z2fugAa13CAFftBeGzbJqfCIUCqFCYl5Ek4dRijxCMhHQJMM2Bt2SF1vi3Nx9qD8PtbY2
	 tyoiHlbJuAgojZkPGtPbATfa21JFmjujR+0+5R7j9cpAo1ZqbciQHlNaJ7tgt+U6n6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=kTxB5Iq8;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0BE606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 06:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B0BE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=kTxB5Iq8
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AC66r7N23489609, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794463613; bh=uq9viipXIbedIQVF1QBORHp4W5G9VrkzQMii6JWr5ZY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=kTxB5Iq8UIj4iyqsQyrHu3Bhjm66vIbxvkjOKxmGLb0yc28gCk2VTGEcm4vgV+YUw
	 6h0MA25CY27GzH3wYU/tKpXFK6ZKKLugCOus0JUQsq2yu6m0KqL6E/9iQ8i/hJR+xb
	 xUnCQphp+1oQfRGYXW2rA41Cdt1JCYppbzFhmJfPkVx8q42jnocGJpNam74IowWsmz
	 Yz6NP7fK6+nvLX6lYZhE2rOEX9Czc8aDN+NKGo0gDMsNC5N0dzCTnrKNYKRsWrVIfv
	 SZALJ2tb09fhyuUizyi70a6ifblVIpwNau3hoLA3rrdbKGoz7wZ8KYHQTbZqa8fDUS
	 7M4Sa+GSDy2tQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AC66r7N23489609
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 14:06:53 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 14:06:54 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 14:06:53 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Thu, 12 Nov 2026 14:06:53 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: <linux-wireless@vger.kernel.org>
CC: <ku920601@realtek.com>, <damon.chen@realtek.com>, <phhuang@realtek.com>,
	<kevin_yang@realtek.com>
Subject: [PATCH rtw-next 08/11] wifi: rtw89: fix band assignment in rtw89_core_update_rx_freq_from_ie()
Date: Thu, 12 Nov 2026 14:05:57 +0800
Message-ID: <20261112060600.71784-9-pkshih@realtek.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112060600.71784-1-pkshih@realtek.com>
References: <20261112060600.71784-1-pkshih@realtek.com>
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

From: Zong-Zhe Yang <kevin_yang@realtek.com>

The rx_status->band expects enum nl80211_band instead of enum rtw89_band.
Convert band from enum rtw89_band to enum nl80211_band before assignment.

Fortunately, this problematic code had previously produced valid values,
but fixing it should be better.

Fixes: e16acf907a3c ("wifi: rtw89: Parse channel from IE to correct invalid hardware reports during scanning")
Signed-off-by: Zong-Zhe Yang <kevin_yang@realtek.com>
Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/net/wireless/realtek/rtw89/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index 1ef8cf5f2dfd..67e84bcdc631 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -3835,6 +3835,7 @@ static void rtw89_core_update_rx_freq_from_ie(struct rtw89_dev *rtwdev,
 {
 	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *)skb->data;
 	size_t hdr_len, ielen;
+	enum rtw89_band tmp;
 	u8 *variable;
 	int chan;
 
@@ -3868,7 +3869,8 @@ static void rtw89_core_update_rx_freq_from_ie(struct rtw89_dev *rtwdev,
 	if (chan == -1)
 		return;
 
-	rx_status->band = chan > 14 ? RTW89_BAND_5G : RTW89_BAND_2G;
+	tmp = chan > 14 ? RTW89_BAND_5G : RTW89_BAND_2G;
+	rx_status->band = rtw89_hw_to_nl80211_band(tmp);
 	rx_status->freq = ieee80211_channel_to_frequency(chan, rx_status->band);
 }
 
-- 
2.53.0

