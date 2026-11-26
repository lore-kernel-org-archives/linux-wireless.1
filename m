Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795684265;
	b=D+G00HBIYa9rjiaANFq1TrWdZ7/tV41DgbZDp3voZN1hASibuHxR/Zrp2sblyKFGMCdH
	 NDa97GCa+ePCQ/mXXNns15Qf1FtIhl1Pi9YmjAL1vrpRbLmgmQ4qr6h8YSIGhb00CrQLT
	 slWNc9FjV86NyCqOlOX0KnzsXeBQpXZUNKuxGEnbaXsXaPG7eDPvVRp2+zsdx+ezdOigx
	 QQVAs5uwHFrPIZRrOXBXpmyY2QrL/EnV9mtG6vjeS48AaCIQOl0dYUG9A+Wv+QxhyW7o4
	 /S70ZmER6kFGay+dmwxCHUd+Lgn6UcLYAFSuwU4l8Y6scgNm9IMF+Vk/JYhP58exAKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684265;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-ZohoMailClient;
	bh=NM9Rh55hrWQUtWuRlmVaGOtV+80IjPctfhxDVtwHRfU=;
	b=YRNuSVa5TXSVb3Lr77xtIwtM/9GnhVMd2CJ3x6FcPsClkkRg6T8lhKCspR4p9e7DwwSJ
	 /MXHWY/dZiBVYmG2IPlVCEKPmSp0eFfBNR5t1OL9jE9ujL4mGin8rDsXSIhT5gNetCEjQ
	 Eq1oIHKCGoi32CYy+nomKD3qEO5h18EcerMLAqOxqIepSX/bATrxNWTi5BqbOaojVVP1c
	 AqF9hDoHaEWRP1TJH1ylOzE+e3HL55vnGnWB0idyfrYiuOwvvV0g3qBUGA0zXdGhY+4Mo
	 tMEWvZyjC99IIYlI0yAMBN3R4+jizO5ZDtUML1F9uYSJxJVfnEB4qZMSMgs7pSs0a4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=15JYOAKv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8E5606A31C;
	Thu, 26 Nov 2026 09:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A8E5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=15JYOAKv
ARC-Seal: i=1; a=rsa-sha256; t=1795684249; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PYNN8BckMTGjnBIi+IS21nKkhfWPJdBSHOBmxSdX+SVhaKHAWG2wXbTlwUjOTniJ+vKq7r4PIgfYvkbpp9J7sUgjX9uaRymnHwB+DYTX6FwcKzuSfyC+KmlxPvA/310X2ynlPMH2SaXZtRruWoNbvmvypqETDSTfPb6HwgVUeG0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795684249; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NM9Rh55hrWQUtWuRlmVaGOtV+80IjPctfhxDVtwHRfU=; 
	b=cOKUuBLjsI4MDdJmcjPELfVxCXQaauDUGWbY4OvP2aQRY4kwNE37k2tOtJ8jXvgSW3z56PyPgf3xXYZwAsdqoDNd0ik0ydytg6TxcDcVJmLLKPFnXh2N9tqO8zQiZdrm32/3j5CouaHFBRCNyLN9M5Zs8a3AyGIY/XjeutYEAnE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=15JYOAKvw5IsnRIdJhDI9OrVNVw906/EvezrjrJ8rUCdg9A5yiJXhJGlJzK7OUY+qQhF7bsYAvzYBsmB7NAFv8O59DJaXop4blydkQRcXN+hStdgKxu4/W16pirNI5VrhJ4oVB+PZqmVQaj+UvhLVdW7Gz4EtrwGx9qod1YX9fEkRXpPE6eydDqzKAz1Sy81pnESr9YhaCYoFXUE9bzmwYzsGRgpST8eII7GhOubA7qMnIhHWiURpZN8qvlr6Pb7ZHRs/Rv1N7V/cUxXM/QnU2o2C7AXY642JMAJ6bi3IFwOqQZb8voQX41KQO/J8nV8EMiMn3IWxL/3Yxp0i74SPw==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=NM9Rh55hrWQUtWuRlmVaGOtV+80IjPctfhxDVtwHRfU=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795684248390969.028798136312;
	Thu, 26 Nov 2026 01:10:48 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Ahmet Zeren <niko3x@proton.me>,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: [PATCH wireless] wifi: mac80211: avoid u8 overflow in ieee80211_parse_tx_radiotap()
Date: Thu, 26 Nov 2026 14:10:44 +0500
Message-ID: <20261126091044.1383-1-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
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

In ieee80211_parse_tx_radiotap(), rate_retries is a u8 parsed from
IEEE80211_RADIOTAP_DATA_RETRIES (0..255). Computing the attempt count
via min_t(u8, rate_retries + 1, local->hw.max_rate_tries) truncates
rate_retries + 1 to u8 before the comparison, so a radiotap header
with DATA_RETRIES = 255 wraps 255 + 1 to 0 and sets
info->control.rates[0].count = 0 instead of clamping to
local->hw.max_rate_tries.

For injected frames with a valid rate (IEEE80211_TX_CTRL_RATE_INJECT),
ieee80211_tx_h_rate_ctrl() returns early and passes rates[0].count = 0
directly to the driver. Drivers that check rates[0].count silently
ignore the requested retry limit, while drivers that compute
rates[0].count - 1 (such as rt2x00, rtl8180, and rtl8187) underflow.

Use min_t(u16, ...) so rate_retries + 1 is compared without 8-bit
truncation and properly clamped to local->hw.max_rate_tries.

Fixes: dfdfc2beb0dd ("mac80211: Parse legacy and HT rate in injected frames")
Cc: stable@vger.kernel.org
Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
---
 net/mac80211/tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index 77d03251f6..230b9d13e2 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -2426,7 +2426,7 @@ bool ieee80211_parse_tx_radiotap(struct sk_buff *skb,
 			info->control.flags &= ~IEEE80211_TX_CTRL_RATE_INJECT;
 
 		info->control.rates[0].flags = rate_flags;
-		info->control.rates[0].count = min_t(u8, rate_retries + 1,
+		info->control.rates[0].count = min_t(u16, rate_retries + 1,
 						     local->hw.max_rate_tries);
 	}
 

base-commit: 35c42b20ac87165c054c582380aa0ff0de8aeb4a
-- 
2.53.0

