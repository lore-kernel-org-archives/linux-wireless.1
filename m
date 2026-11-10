Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297724;
	b=ompSRw2m+56rad/Z4hLB+5t1p46uNBhscpfa4nj7peWUAeTvQo4P8yDzX41XtrN+0O1T
	 Ku5EW6lBaFRQemvMo4dMQy8RjWj8huU5fe0CnXUCMsqZBWrOF60/HgRaprYLCMpEZM5v3
	 9K+E0qAWgw6vQHYVFEPdWPRiv87NLQfXfQYU8hcfGD/0/LxyG9l8mfYdF3BfoxaE2vfop
	 +bCWUGCwLfkVaXag0obch06IIXAJWtz5iCx3aAO665YjJ0oqk++PLRwhk8hI8TfJ71hj8
	 GEsT1roMI5fODPCmE8a01b4QvCpO1XdJapbwLEBouklIH3DFqS/a/AYAPDATX/bzFpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Cig+jScI/TQIlFINEQ7/KEmc9aqF9xYIoI0bZxnjsQU=;
	b=zasNAntcioCo+f6rdqnSKBn7yQEPqPIvIzSjixxTnF2+ZpobmxtOCFv6PsWvDFrxTDwh
	 BewjezWoHjqbddEfFlcVMgC7B2t27CdXf4HzpcXs4KB2WpsRCQ0NMT/SafEgeOoPBKyQP
	 P5VmF5U8uoUVINn0xe6MgkD3763nZPBFONQrqVE6f8FvgyFHP9ItXlJMTdkaf1YMVqIvG
	 39mpc6AJF6XOnjy000/v2duOKON3SDVCg2QAKMKBVIqOFaB2tIQuJYLEJa9N2+VnLF9kH
	 NFrSus40uEsjGfWF+5eTI2oqkwia1im9UmejlZAxoOrTExktDbsy12p7p4vISzgovng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wO067gq3;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C28E6077D66
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 08:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C28E6077D66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wO067gq3
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b0b3754f57so1027793a91.0
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 00:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794297724; x=1794902524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cig+jScI/TQIlFINEQ7/KEmc9aqF9xYIoI0bZxnjsQU=;
        b=wO067gq3LmKNCVoIiRw245+TGcAlx95qB1NCJayKlIUjALgoFa/dptHUIgfK2AlARV
         /oE3CkEkZ0ih7qQ20Fy4w8W1UwMYqeV55WJGrVZK57Ui1eMCVkRIdxGdJZUOzvD3y53u
         9vh/bFKI9dELJi+kFSfXRjTlqaX5C68+hzomh5yX7Yn2+PcqYobrKGbEK9VaW9BIj0Mw
         TbG/l4CCX4rY8D8GxPUU/AnxH4zjQS48ZA3T9HiHofBO3uwWEnMzNr6MfQW4kVNJbkKb
         X2sFinV8Bl/PkJ4AlExAwHYWH0kkynaJr0m3KtChRC5X/qgi9lQdIwweJyyuJuH5NDbw
         lk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297724; x=1794902524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cig+jScI/TQIlFINEQ7/KEmc9aqF9xYIoI0bZxnjsQU=;
        b=D/pUUqUs72vQpv8IdcztwAte/Yui0UlneIAyMbMpwwYjINTwWi3s3QfK098HDJ1KH0
         ZGBTKHbUlIj11lcmqJM6zkVyqFbTsyY3vhlQvsylSdyQJ9/G+t9CW6rfqLYMuiaC/oVP
         lzl8jpXjXvsH/tXbLDya/3q1UDjaCP8VwD+aRzKq3BB1BYyEfdGE8g0usGGMEAuOXIRP
         x4eBzHChjyXOz4j4ML6CgYWNLoVKZkfu5ioah7xzuIHuzQKZYcN2VHPD3DtwEifxaLz4
         5UGRC5rYLGZvXPSsgIhieLiCSuZMx1AJD0FJMLoeBk3m8p9QxTtwHuNgKpHyiUkorSwb
         WS1w==
X-Forwarded-Encrypted: i=1; AL+hErG7SMamq+JosM0PhCO44W1Jrp/xmMYAPQi2kHHkl/2eE5M2ByNOIY2epzP+X2AZCVSTwjeXVZSYI9CksRvyWQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+h1SmWU1Ef51XbgsZUN3VUKkTvrxUVxXYMrBJ/mucXhzo+SX6v
	9GbDVxzn/IMX/cUkIXrrVjnrnXmV7/GP18NLWplU/iVAyncoWRswVGHA7SO6fdov1GC5oQ==
X-Gm-Gg: AYBFou1KSnZR3J+2X3pD6N4rWjeSufMXhDZBzT7rUn+EU4Qm2UtqlVG7vzTzETUkyCR
	2hcBYVKKJvwoSoQwBJLigh3oDGwrEtlw3AanIXFk3wRxpy3MLIsk8aQbiFzP4TPWOFG5zeDylUh
	NAuxlEfkSAPGDvmpAnlH2aIMbYGP52yL+vb30JxiA8hGcfcNH2qumV2U/Sphur3fTdFZKLgH2je
	NrogKaxbdWUSPh1zcP82HPzcUajq+Y+mVMTaof0AWkuEyjmvxtQbKjLMO1DnwXUVboJucgTqBL/
	rCrkXQEhJ6vaEDj84QaPAUkDyR4AJnXHQphStw/0pExw08sPjn9LUeXiRX0L0pkEAzTXcBm1G0I
	GY8udQtKCgKfXndgRlRQxxS/7uKyuC934fWIz6DvENLvNdnsxUWKYnZC7oEp4rmRI8nJIlgn9zu
	ADeMoaTyH/YGnhwPiXTlDP/EH5x79lygvqN+EWAMGvvK83WXQ6NGvvEKLvM9e+BlUok2Qjv+t2Z
	Z7qR38WJ7kiDLx+MBgyyJBr/jTry2zoulAorC04KkjhtNDUcY0PXXMmrIrvs2dw27pDi6IMzaOH
	8wiJ3dGwy3Olk85G9SC7T9TSl1kHkU4tQnWm4HPC/UF1l26yC/vxdGepz3BkPD/FTjlYUNpdU49
	zJ5zEw/EjSIdiFaRXchEoVJC/zlLlrw==
X-Received: by 2002:a17:90b:2885:b0:3a0:ace4:d2b4 with SMTP id 98e67ed59e1d1-3b166cc15d1mr1750001a91.23.1794297723479;
        Tue, 10 Nov 2026 00:02:03 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:b87c:eff1:b55f:23de])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678ceda0sm2906627a91.5.2026.11.10.00.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:02:02 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v2 3/5] wifi: rtlwifi: usb: unify the RX code path
Date: Tue, 10 Nov 2026 16:01:39 +0800
Message-ID: <20261110080143.1362021-4-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110080143.1362021-1-hjf3108@gmail.com>
References: <20261110080143.1362021-1-hjf3108@gmail.com>
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

