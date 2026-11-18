Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795025183;
	b=ptMD/4y/EK2ycbosXYb9tp6vU52aC/OeQtfAOkJecLn1cAQSi/Hy4bJB7QefA0Y5FXdj
	 KGuFOoeHsttdrz5ahKEfw7Z9iY7JdVaRG+FROPCTxvxueh4ifqLLgOhndgrfCUjFsWg2F
	 9wn4imJnBjqPnv0wf8U9eyJ4qcGUpfXyT5OhaheErFoGCVqV/36F8TvNhhyfjQ0xdagwh
	 bTfcB5RlXLMVcEpXlayP1ZkBXtEoPZQs0KlvY8vTCQSM04eeaPENzJRIY0B6tXDXYURyZ
	 wRsMkl4r3wBhjvZRYs8kYisUiqWDuV8yH40wx+O2X3paSgmjT37mLmDDpwIcfKU0srw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025183;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=wNd2LPZyuAEEWn7MpVOXJDJO7rW6ewQN3AF71lVeLY8=;
	b=kD07HLdphhxpOLnpMh54vnIooM2Xk+iIVxqBjRtk4yuJlpqhezNwHQ6ZvyGjvYUTjIGY
	 95+ZgIB5J8VKLlynu0yJz6n+/UJZc4jIpuZwgDCGjwhLZc71G/cWQ+JUTFXxha6638PKR
	 TnHWllhG6Lus0R2Vqcff0eMmiX0BFz5RwmMDdPJZFDyvXarxjyBQnxx1jJ6bEYgNpHwqV
	 G0fDdYr7aS0V/C1efc1wrzXzp+8WCzbgz4PmhzNSpbKh3kK6/LBKZnIzZujnmq1qney6S
	 arcZnZPr5A30ofX44nQuC8oQlK9PRWJ8vVZ2ahaXaqKSSl4Boqg/I3HutL4IAPvv+XA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=eokonw75;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
Received: from sender6-of-o54.zoho.com (sender6-of-o54.zoho.com [165.173.180.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36534606A336;
	Wed, 18 Nov 2026 18:06:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36534606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=eokonw75
ARC-Seal: i=1; a=rsa-sha256; t=1795025086; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=X09axsOpixziseyJ3NMP85DNvIZcExJwg2agcpF6I7cUvFVLusFiXGJ4q+pXfW/9Kl7LSpwm8Y7cqXpP1ImTNqtUj1rKQNn9XDe3PZxqKgmXSB+/NlIQhVXQmqY55YOwzfXAtGMSyDDlkeRdQduZdtMeMBRXlbLHEkOMUMRjc1E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795025086; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wNd2LPZyuAEEWn7MpVOXJDJO7rW6ewQN3AF71lVeLY8=; 
	b=Hd8HpI4lANywUCzJoCsrSUtXjw9GoUKAW8mzexyttO3Oc/dlzlXj+Uql7WV8EJQV17GTIhQDrRjByI/HLDT8qPvhokn1R/MpioJQdt7tN15uHugu3qkIhKg+nb2TMEJtedOJ2YddntRB7MJbTVTrssNwT12pSe5+0zsr0GsNJds=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=eokonw75WxgAthNU0OF7Wy+1E35UkYPb/fIsnQUEDvyY5V+FlK2JS7WmkCLSb2/Q+uW7SsDBOWw6n9Ukqfk4E0xWvmYo84Ee13TYD3h/B++mamZ4Il2yAGH2BN6xS0fGJ0d2UVXUmK2DPGNx65ctVa614R3nAjKS6Cghm03eagwZAQWe1Y+ChZaKiVnic5jkMh7ENRgCDD7iGbZcv0I11Z4bUFwwxpVRsaTch2Q3ehRJik3/iYLMAEHgYEO2fAtLJe7SCcQEGMQdvKewLurvlul2+k/eBDoQfMWBeAB9NpzOi4WCk8kjOoTJm5dNAdHWkUq4xApd0q3flrX8Pe0SgQ==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=wNd2LPZyuAEEWn7MpVOXJDJO7rW6ewQN3AF71lVeLY8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795025084043363.4078473415681;
	Wed, 18 Nov 2026 10:04:44 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Zong-Zhe Yang <kevin_yang@realtek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: [PATCH rtw-next v7 2/5] wifi: rtw89: handle negative rate index for injected frames
Date: Wed, 18 Nov 2026 23:04:32 +0500
Message-ID: <20261118180435.904-3-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261118180435.904-1-owner@ph4ntom-rev.uz>
References: <20261118180435.904-1-owner@ph4ntom-rev.uz>
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
X-ZohoMailClient: External

When user space injects a frame with a radiotap rate that is not
supported on the current band (for example 1 Mbps CCK on 5 GHz),
mac80211 sets the rate index to -1. Storing that index in an unsigned
byte turns it into 0xff and programs an invalid hardware rate into the
TX descriptor.

Clamp negative rate indices to 0 so the lowest valid band rate (1 Mbps
on 2.4 GHz, 6 Mbps on 5/6 GHz) is selected.

Fixes: e96abe4fd7cd ("wifi: rtw89: consider data rate/bandwidth/GI for injected packets")
Cc: stable@vger.kernel.org
Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
---
 drivers/net/wireless/realtek/rtw89/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index 1e8b60e..37ff745 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -1259,7 +1259,7 @@ static void rtw89_core_tx_update_injection(struct rtw89_dev *rtwdev,
 	enum mac80211_rate_control_flags flags = info->control.rates[0].flags;
 	struct rtw89_tx_desc_info *desc_info = &tx_req->desc_info;
 	const struct rtw89_chan *chan;
-	u8 idx = info->control.rates[0].idx;
+	u8 idx = max_t(s8, info->control.rates[0].idx, 0);
 	u8 nss, mcs;
 
 	desc_info->use_rate = true;
-- 
2.56.0.windows.4

