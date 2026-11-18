Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794980808;
	b=DFtoJ2Gdz8Koi1tVVQUagk8kEnl2Ki0EBV3KTI+V90LE/Vd/TwK8XFNj7uCgwdzpS0EN
	 HSI3TOhmgFwOFa0BbkH8rl5FCfgPcU6d3kSa+SidMVgD+ZO0XjuVpFbd/cYRh/tJZ4ytA
	 xfllxHDEeKQJ+XGOwKxXUisFuJdbvNdnmujFa/WAag3W2a0L9StDatLzZRIz/l950t4fB
	 4e922kztpPiJoW1aTwcpdzDi2c1FMbExMMgFoZyS641kZVkoOUJekfYHQVhK+QYwQQ0aG
	 P0V0HwzmVlDJ0A4xUm/QzmV/4SBb/077mGUbKehDKrEOVbYaCr9MwersidfhSyplIyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794980808;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=YV0M2AnUrY2KAPRZn0ZFhfkf3bs/lypYgylfMnCOLTs=;
	b=l0bd0+NCk0UCM39TdO6Jd/RHYNJqMCb0V9TpCGMYvyAbtMk6EEml8KSe5BBlrkQ4htr2
	 SXE7hEi4HEMhHC1IlwYYB6uQryrTcO8wMQ1IHqQz7OCTXdUsXeqAP+BFAbElFThAEH09o
	 Ku55Voh2XOHE+0NJFMAT/jIPJEn7sXlZ7CBaIc3g87l15+gIJ4jQBpQtsbtoNgG7UmjKn
	 tMBWUlrfpSLnIyniD2uBhooa6SMwwOGeWyWn44S5QxONRczpWSj9i2dS3ayYT1QRqwvn6
	 ONlEDfSlBoA/7v4vghONTa9EPLtP+eahI9R3h6ZUPW0RnjJBABZZiUIaJuDDQHgBcnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=JssbCFx7;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192B5606A31C;
	Wed, 18 Nov 2026 05:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 192B5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=JssbCFx7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=YV0M2AnUrY2KAPRZn0ZFhfkf3bs/lypYgylfMnCOLTs=;
	b=JssbCFx72LuNZ96xeDBP/68HrTFSUkz1J3m1xtBHErknXm8hsvh9wvt1/l7JoF
	5BFCGgD6MABYmiWvk3jiC4nFbzGcSOv3tBWu6RPWvXM+0JqJBBZgd7/X/T/X6sov
	b4WjhHMMdGYE/YI9Q4d7alylKOv8imdwHDfvuQV/Ix+aE=
Received: from WIN-TOG0NDEIICD.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3l7KxO_1qDAR3IA--.59887S2;
	Wed, 18 Nov 2026 13:46:26 +0800 (CST)
From: Shirong Zhao <shxzhaosr@163.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>,
 linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: rtw89: read the beacon header from the frame data
Date: Wed, 18 Nov 2026 13:46:25 +0800
Message-ID: <20261118134625.801221-1-shxzhaosr@163.com>
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
X-CM-TRANSID:_____wD3l7KxO_1qDAR3IA--.59887S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr48KFW3JrWkZF4DGw13XFb_yoW8CF1UpF
	yUCa4FyrsrJr47u3y8CF4fZF4Fva18tanY9ryYkw4rZanxX3WrKFy5KFZFvr1jkFWDt3W3
	Zryvqr45G3Z0q3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j5miiUUUUU=
X-CM-SenderInfo: hvk06xhdrv2qqrwthudrp/xtbC7hIVU2r9O7Ip3QAA3Q

rtw89_fw_h2c_update_beacon() and rtw89_fw_h2c_update_beacon_be()
cast the sk_buff pointer itself to struct ieee80211_hdr to compute the
TIM offset:

	hdr = (struct ieee80211_hdr *)skb_beacon;

The 802.11 header lives in the frame data returned by
ieee80211_beacon_get_tim(), not at the start of struct sk_buff, so the
cast reads sk_buff metadata instead of frame_control.

For a freshly allocated skb skb->next is NULL, the value read is 0 and
ieee80211_hdrlen() happens to return the same 24 bytes as a real beacon
header, which masks the bug.  As soon as the skb is on a list the
computed header length is garbage and the Group IE offset passed to the
firmware is wrong.

Point hdr at skb_beacon->data instead.

Found by code inspection; not observed at runtime.
Signed-off-by: Shirong Zhao <shxzhaosr@163.com>
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

