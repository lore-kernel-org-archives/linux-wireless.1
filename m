Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795065928;
	b=aN/wufOGlNTEgV4ISlcXgfmZCXobZ7VE6KpL0cJJ6hH+gA8z6uTKOesMPznBcPgJOoOl
	 WGhOK+6oj6+HhL/Fu1wFe5GPeDvLgykJHZFYfK6vmg7hm0pL8n3EFObksqLEKXme1bXAk
	 cEBRATdX0VXar/eIFUNB6lTChOq2cUyemCVFMq3IYwkWqP5gUBnFci6A5Blzwy2zOnvID
	 TfdgtQIPl3gwWS/ugKxn8xzvMv9/FMMxB+rXKNo0RF4qQKDYDqfAfUt+79Nz8PfLpwsgR
	 8Q6/2NcW3Ge5HqdNC6VuWaiNt52y/NYM2wlONJF1qdudGnbPF/v3x8FKUdivhlEGQfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795065928;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=WkzfnsCxTGJ7SBf9D1oAQsw8JPWrqMFipBBuf7+IpqI=;
	b=i7o8Mo4GCwziQe8Lf2uykxdOnx10WNcIygZ/o0sMygWIvKNEyz3HC1eG1JpoEf6Ynd3D
	 qxPhfaduIn59nwfJzUBZyqbJeypiD9gOtQr9RNqu5IaCXa3o0r7HDIqKV56/uGwgRN5hS
	 CnBMXqc/GKQ+TXj5jacJ0IkmxoVKijf4JqpPw9sCg0uD9ixHamMWKmeqCMAQnkcf69osZ
	 NDBO+Q068YhAl0aiT9u/AzSXBYnJJE1sUE+DTARcr2ypEP70mqHd6ymljM0R0z5+TaeTg
	 sa8AlnBiKr29oFDsihhEN3gXlBZHebwnM9Fi0DuO6QxJrthx+/Ga8Nxl+wv3DMuRSbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=F08M9FTq;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0216F606A320;
	Thu, 19 Nov 2026 05:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0216F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=F08M9FTq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=WkzfnsCxTGJ7SBf9D1oAQsw8JPWrqMFipBBuf7+IpqI=;
	b=F08M9FTqbPrSYvpP5+peVPmxcZJwfAolqPALbTUc2S5qR9xjodyd7dEnu/cQiC
	rF8oJ52fo/ok9aMNmfXDYuvAUUDU1xjTaNseuiIKGR94FjasM7P+LQM9A97qOaM4
	jRBS2Js4DmKsQy4PSj5+a/9/fmEMsbbHl5NuaMef1lyvY=
Received: from WIN-TOG0NDEIICD.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDnb5w0iP5q8NxfGw--.11886S2;
	Thu, 19 Nov 2026 13:25:09 +0800 (CST)
From: Shirong Zhao <shxzhaosr@163.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org
Subject: [PATCH v2] wifi: rtw89: read the beacon header from the skb data
Date: Thu, 19 Nov 2026 13:06:18 +0800
Message-ID: <20261119130618.455918-1-shxzhaosr@163.com>
In-Reply-To: <20261118134625.801221-1-shxzhaosr@163.com>
References: <20261118134625.801221-1-shxzhaosr@163.com> <18e2bb0a73414b528db9741eb2e2e1e3@realtek.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit
X-Mailer: git-send-email 2.53.0
X-CM-TRANSID:PygvCgDnb5w0iP5q8NxfGw--.11886S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr48KFWUXF1rZrWrWFW7urg_yoW8Kr1fpa
	y5Ca4FyrsrJr43ury8CF4fZFyrZa18tanY939Ikw1rZFsaq3WrKFW5KF9FqryjkFyDt3W3
	Zryvqr45G3Z0v3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j5miiUUUUU=
X-CM-SenderInfo: hvk06xhdrv2qqrwthudrp/xtbC7hWJx2r+iDVGMQAA3r

(v2: reworded subject and commit message, added the two
Fixes: tags and Ping-Ke's Tested-by/Acked-by)

Point hdr at skb_beacon->data instead of the sk_buff pointer itself,
to get the correct header length for the TIM offset passed to firmware.

rtw89_fw_h2c_update_beacon() and rtw89_fw_h2c_update_beacon_be() cast
the sk_buff itself to struct ieee80211_hdr:

	hdr = (struct ieee80211_hdr *)skb_beacon;

The 802.11 header lives in the frame data returned by
ieee80211_beacon_get_tim(), not at the start of struct sk_buff, so that
cast reads sk_buff metadata instead of frame_control.

Fortunately the original (wrong) header fc is 0x0000, so the header
length is recognized as 24 bytes, which is almost the same as the AP
mode application.  The value is still wrong in principle and would
break as soon as the sk_buff layout supplies a non-zero value there.

Fixes: 69466b979a72 ("wifi: rtw89: use struct to fill H2C command to download beacon frame")
Fixes: a880b9283009 ("wifi: rtw89: add H2C command to download beacon frame for WiFi 7 chips")
Found by code inspection; not observed at runtime.
Tested-by: Ping-Ke Shih <pkshih@realtek.com>
Signed-off-by: Shirong Zhao <shxzhaosr@163.com>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/net/wireless/realtek/rtw89/fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/fw.c b/drivers/net/wireless/realtek/rtw89/fw.c
index 21b548c..0eab77f 100644
--- a/drivers/net/wireless/realtek/rtw89/fw.c
+++ b/drivers/net/wireless/realtek/rtw89/fw.c
@@ -5130,7 +5130,7 @@ int rtw89_fw_h2c_update_beacon(struct rtw89_dev *rtwdev,
 		skb_put_data(skb_beacon, noa_data, noa_len);
 	}
 
-	hdr = (struct ieee80211_hdr *)skb_beacon;
+	hdr = (struct ieee80211_hdr *)skb_beacon->data;
 	tim_offset -= ieee80211_hdrlen(hdr->frame_control);
 
 	bcn_total_len = len + skb_beacon->len;
@@ -5209,7 +5209,7 @@ int rtw89_fw_h2c_update_beacon_be(struct rtw89_dev *rtwdev,
 		skb_put_data(skb_beacon, noa_data, noa_len);
 	}
 
-	hdr = (struct ieee80211_hdr *)skb_beacon;
+	hdr = (struct ieee80211_hdr *)skb_beacon->data;
 	tim_offset -= ieee80211_hdrlen(hdr->frame_control);
 
 	bcn_total_len = len + skb_beacon->len;

