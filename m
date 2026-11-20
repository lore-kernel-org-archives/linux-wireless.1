Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174298;
	b=u3PqP/b8QVK8mouKuiUTmJ8asTkch18+i5/Nzgfr86JaMgCfszeERr7/PnasE0XNAPAt
	 PfUq0uceKhkjm1Re1Q1TMObl9a1qrN+odRMupaoRCtlFCkCEUuRc/kInY9+XPofKLSFvv
	 DyJM40ZI26HYpvp8RnxamRZhqHSDosxODUZz13iAhb7MstqRw4rDApx3yHuvgITyHqikZ
	 zIN1G0lndhS+lc/Jg3Zog+3FWHem61FopnlPB5nXnkPcfPiFyrfzABDCGtnPF27TeLUdX
	 n8NhgYNF1aPg6wIEc6pB3pFVfolXYVQ1m3B/gbvDYDacZNvuavwHCiD2F2hdi7wVwMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Cig+jScI/TQIlFINEQ7/KEmc9aqF9xYIoI0bZxnjsQU=;
	b=Up0eWcnjdGKl68QG3xevjpIi22pwK2OSlsHY9JC8Dkzd6JHV8W2WV1tCjQoybcQJ1yp1
	 tQVjEn5tjPqZHDqZoQCdcwqYsmlzjhCRI7fnwyYCFhgq21WCAU+9sI7AbqMA9I+cE4H/H
	 DVp/4ocWkm3yL7bMkEkvX1yBTc4h0rD1aqUDCuVqlhawUzdetsEPRFCghgvxT08VzDGh9
	 qFGrotATY7YMvguTMjwfQ9G5AfC5lIdftjDlX7Sbe+F1ad3WsGVdulIMv2iI65l41ogVr
	 LxHO4+92Xfu7KxPnzySNRXyfChk3LRaTxSU0DCn8JXuEzgYKbzIYN7B62JosRhw2iLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=us6QNTHX;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE8560A3804
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 11:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FE8560A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=us6QNTHX
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-382c3c9671fso1071674eec.0
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 03:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795174296; x=1795779096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cig+jScI/TQIlFINEQ7/KEmc9aqF9xYIoI0bZxnjsQU=;
        b=us6QNTHX8oXhp/mQk6OZMFrKfqOv5ZM4HFYQMEmcWnn6dOL8G8XY4qS/NYQiAbqKl0
         MNUeQaLnm/A4uXtK9DtPZBYplSw7AmCqWou/o3/juZdgxO99o5z5MIsCjCoC9fahklDi
         oUp7b/PLmeDt2K82N00KV9fu9NfNTYQ671oupRm82B1aPiw0VzTAxOcNR2aGEMsLC9MO
         L0ocpY+M5q/gYou99bTVOTJIHgNL6AQ+Bf/hTITHpXAwCFjqoGjngsKp/FG3epXLpABp
         38nZ0NvpNcWCFDMHzg++ES1+kekQgSdkeHjd73PNZDm/Vaw7R3Ij2fUG5sCflUoDyOcp
         tXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174296; x=1795779096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cig+jScI/TQIlFINEQ7/KEmc9aqF9xYIoI0bZxnjsQU=;
        b=B+ssBS1zQ/xpp7dkVBF1caBjsUWfHlLWBXhou+69lXwVusKCIeNQlR3l/334wy74rd
         5HsSwu5LJRj7JR/QGr4algupgK9LzPfxWa+/m6rukrXwciWxfTMRgbe8XE8WdSf68/Lt
         IBDshWHIJpGIsysc3OkEcTjTH7qvBXGYWKkJgZM0qTxt+5xkL8XZuj0wtUXO/ot8q1w+
         O52h+uf9u8+XEAZbleB9PF7axdDaL5/VsqPF/Zqp/oHUG9MzF/LIPPt2mfOvJFuvUoJ1
         XyrfHIN+Ir72P1y/d3NML/drFb7+i1MGacFR93YVDYC0ALvl8fxNv9nwoeVGarQYlRC5
         o+kg==
X-Forwarded-Encrypted: i=1; AL+hErG+GvWVO2gnAg2b7xUGhF9YoptZOxBerP7gowfUUgaHT4rJDIhL2+EAnNo800SmuLcVF2gkrA7Dg6wJkt/jCg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+0+yk/bQnnGJHWTpibp5vLlXmyWtk9giqEySYM9h0J+WEDhJVo
	XTLWCoZhJraj6FBkuG73tI5oKAQOqWwjX7l8by6psaOAMgCOXkhdcRrZ
X-Gm-Gg: AZFdTZcUhn2AmbUKV3X5RVWwmw9+MjfZ/UFWmYScTPAC6a/e/qr/cBLBBQzSBhastKG
	A2fL8kuTalmfkp9nZkIdQyrXzJkRtjHNtNrWFbcaxmIsIichOViu7pS05rAwC2IUsFIoYWxqlqM
	WaU824icuHzjtxNl6dAzHh7dLKrrHS24BwbjIEuZyjIwNjyAd1SNdRkFVCM+rSrze/wUzuXqQ90
	tUw9z40whw+MjTbbeBnmMEVBlRuv0xQGViJf5DM19/Vqw6OX4mgb2ozdpUsIgpfIKEY+uwWTyb1
	BbYStzBdUO2gMbkQpFCr7EPu777xG7wC7XvyTCivi1UX7Gv2T1lzdCCcnCJ58vMmtpT+QB+Mf0K
	dA6L4eRh0r8+ODhPSxwbH36h0G/Ra/iaG0PZ0Mub4xhfyl3RVULz4jmt+Mp6q4gsR4ERtGuDeI+
	Zk83XgnRFMsQFh+vjMxRcBRx7rLUWwwA6oa6VxXxCh9VcGTebb2bh2m6iWpd+e7dL0HjgJ6Njii
	DGmkOWq37NqwymbXgk9h8ROUSgzl1WhVUDn31Prh8sgFvEguRER5F0ob6UMqh+vicYNiTjXOAdn
	lgtUwoTIBhDKbt94pKai42aJigHshkVV+NSZM68zWcJDjfCI+WgLJJcZ5+lzmsjjPKhUpiU016L
	i9r/g0HMQ5xtDY+C2uUdWf70wwswKOkcrXCXhGNs1qjlG
X-Received: by 2002:a05:7301:7187:b0:386:bd8:7ab3 with SMTP id 5a478bee46e88-3860bd88965mr1263059eec.29.1795174296329;
        Fri, 20 Nov 2026 03:31:36 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:fe98:6351:c2cf:22c3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm7134347eec.16.2026.11.20.03.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:31:36 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v3 3/5] wifi: rtlwifi: usb: unify the RX code path
Date: Fri, 20 Nov 2026 19:31:12 +0800
Message-ID: <20261120113116.153232-4-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120113116.153232-1-hjf3108@gmail.com>
References: <20261120113116.153232-1-hjf3108@gmail.com>
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

_rtl_usb_rx_process_agg is a copy of _rtl_usb_rx_process_noagg
except without the tail end. The noagg function can be used for
aggregated frames, so drop it and rename _rtl_usb_rx_process_noagg
to _rtl_usb_rx_process to unify the code path.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/net/wireless/realtek/rtlwifi/usb.c | 52 ++--------------------
 1 file changed, 3 insertions(+), 49 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/usb.c b/drivers/net/wireless/realtek/rtlwifi/usb.c
index d013e59869..d7b3192262 100644
--- a/drivers/net/wireless/realtek/rtlwifi/usb.c
+++ b/drivers/net/wireless/realtek/rtlwifi/usb.c
@@ -366,50 +366,7 @@ static int _rtl_prep_rx_urb(struct ieee80211_hw *hw, struct rtl_usb *rtlusb,
 	return 0;
 }
 
-static void _rtl_usb_rx_process_agg(struct ieee80211_hw *hw,
-				    struct sk_buff *skb)
-{
-	struct rtl_priv *rtlpriv = rtl_priv(hw);
-	u8 *rxdesc = skb->data;
-	struct ieee80211_hdr *hdr;
-	bool unicast = false;
-	__le16 fc;
-	struct ieee80211_rx_status rx_status = {0};
-	struct rtl_stats stats = {
-		.signal = 0,
-		.rate = 0,
-	};
-
-	skb_pull(skb, RTL_RX_DESC_SIZE);
-	rtlpriv->cfg->ops->query_rx_desc(hw, &stats, &rx_status, rxdesc, skb);
-	skb_pull(skb, (stats.rx_drvinfo_size + stats.rx_bufshift));
-	hdr = rtl_get_hdr(skb);
-	fc = hdr->frame_control;
-	if (!stats.crc) {
-		memcpy(IEEE80211_SKB_RXCB(skb), &rx_status, sizeof(rx_status));
-
-		if (is_broadcast_ether_addr(hdr->addr1)) {
-			/*TODO*/;
-		} else if (is_multicast_ether_addr(hdr->addr1)) {
-			/*TODO*/
-		} else {
-			unicast = true;
-			rtlpriv->stats.rxbytesunicast +=  skb->len;
-		}
-
-		if (ieee80211_is_data(fc)) {
-			rtlpriv->cfg->ops->led_control(hw, LED_CTL_RX);
-
-			if (unicast)
-				rtlpriv->link_info.num_rx_inperiod++;
-		}
-		/* static bcn for roaming */
-		rtl_beacon_statistic(hw, skb);
-	}
-}
-
-static void _rtl_usb_rx_process_noagg(struct ieee80211_hw *hw,
-				      struct sk_buff *skb)
+static void _rtl_usb_rx_process(struct ieee80211_hw *hw, struct sk_buff *skb)
 {
 	struct rtl_priv *rtlpriv = rtl_priv(hw);
 	u8 *rxdesc = skb->data;
@@ -470,8 +427,7 @@ static void _rtl_rx_pre_process(struct ieee80211_hw *hw, struct sk_buff *skb)
 	WARN_ON(skb_queue_empty(&rx_queue));
 	while (!skb_queue_empty(&rx_queue)) {
 		_skb = skb_dequeue(&rx_queue);
-		_rtl_usb_rx_process_agg(hw, _skb);
-		ieee80211_rx(hw, _skb);
+		_rtl_usb_rx_process(hw, _skb);
 	}
 }
 
@@ -490,11 +446,9 @@ static void _rtl_rx_work(struct tasklet_struct *t)
 		}
 
 		if (likely(!rtlusb->usb_rx_segregate_hdl)) {
-			_rtl_usb_rx_process_noagg(hw, skb);
+			_rtl_usb_rx_process(hw, skb);
 		} else {
-			/* TO DO */
 			_rtl_rx_pre_process(hw, skb);
-			pr_err("rx agg not supported\n");
 		}
 	}
 }
-- 
2.53.0

