Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110612;
	b=BxpDbJ0oeWPRomG8nAzSWZX8Z+ePxcrMEYzrgCUX8qdD3kkgVY8i9wv688YYOTaj/oMS
	 CSB3oSeyLLNv/N5aOInChWdKYybPKU3Bm3vysOCt9JOPrjMrB8kgfPqG4ugh8G8QmTuTI
	 kHcIZib4vtVEkKar2Av/m/B8JW1NF6OhBn+Tyh+Oy1YLP4FMvSd1iFXyWvlql4Q208OAI
	 IrUeQe9Tt91hhGnmeSEgowSiYa27nwQx6bpXLV72yohVpcNNGDdUrG50u2Qu4JLl/Ae4v
	 jiCT+P4peX4mc2Qss30vEHL3j+2NN1ts9QnYn3kRNaFl34ZtDWcj8PtCDDsHEgtWQvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5m08k+pWTgZ26W4H99NIdw305iHAopUdzj3Kg8DMx8c=;
	b=yVU1OU0ee3s/PBqlOF8uOeWXYDWNnrrZ/vgzPQb5IkI0nCterlt3BHqxbeAWxgZTlXWf
	 4Sc+LPapKjK6CrRLmjE/T2QBab9P5Z+Nvlgbxo9VF5ZuCmyZC6ZzNFhBzon2ftOrSJYtj
	 9pK23P+csBgOeAOF3Hfy0E0KlSxewvVHlev63BCLKKkszKs4ojAjh25tF/Mi0/ebYcLlf
	 1/KE0kuDdDqJqSeC4rKAa7Cg6NQ2WsVZj29po0OCA0yuTPhc6uIOFK+5JE6Wf3fe3ckvn
	 ttczkZ8bp7gcboEgX/WgMJD2l7AWRoUm1+y9td15Et+zXwWQbbXLrOXVoumZP5KJHNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aheymans.xyz;
	spf=pass smtp.mailfrom=aheymans.xyz;
	dkim=pass header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="fvJykZ/n";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61DA606A33D
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 17:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B61DA606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fvJykZ/n
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so27644825e9.2
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 09:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20260707.gappssmtp.com; s=20260707; t=1795110610; x=1795715410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5m08k+pWTgZ26W4H99NIdw305iHAopUdzj3Kg8DMx8c=;
        b=fvJykZ/neLyVItFEhBuAi0WmfnkNb8Y4jIVy1xZB3JP5mhV0QHRRKZuIo/1ChInedQ
         ozTOCjI7wfcchmNYhF669sue2/HmF0Uy6XdyhIrtktpdEYN3CyMnTTIufpcXJDebi4CY
         eOcOpBits2EoRc6ryq8QttSom5epvDHt7vHgHeTqiMIJNN1aOJRK0GQFL1Y5FTfzhkXE
         yyYVP4MJRF9EH1kSLVrO+m0Yi0PYAKmgSL7sGRfB1YTQtsDia+DoKocrsqZHpJoqUY59
         n+XiF6L3WfCtONnXjhitg2wRYLsXpW8Si8BnzO+aQ5aVv6QnbUq+c4PNY+/Od58FQ+4z
         HSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110610; x=1795715410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5m08k+pWTgZ26W4H99NIdw305iHAopUdzj3Kg8DMx8c=;
        b=AAOgVGkhP2ZLfZzZTHRdqV7Z7TQE4RZEhj9/4SGKSFSechxcY0gTmHyLXRtGiwSA3Y
         e+/NH2QuSw51uDkw7jQKVQs1SDiR+dIA5BdKfX8rKlD2iyiOHZ1j2pQ8uyn3JE0FW51X
         1basZl5MCC1Q/Cj1sKpoa3ViKxnQ78ecma2tlN5ru4lPA+x6ofwctlincR4ReSSonnlu
         fVLeEdlsagsMwFadc4/w7oRwXnNUygJpHk4RlHodJEtszDOohBw1k9kv1fq9//jWe1rc
         9OX9ikDNFZ2iKFPk2Toh3rtqcb8nwndKEKPiNraWZ4MaGOtzmGpf6pyr9ChrNtsNKb4P
         fOog==
X-Gm-Message-State: APuU4Z8e3g3tS8+RjRier18J0tfSubm2Bk2spC8Qv63yhyYH84w2MkU0
	J3AC2hIB+nPWkc9gbqA4cW9N0VC46CTIrnVqXB6IBlfnt5G/Ulju6OE8dfcxPZ7vEbQIBLzOVxT
	cNkpLwnM=
X-Gm-Gg: AYBFou1pwtogpHLdRwcxQP3yAgCn8LIVZFzXGg+6JiUDIqh/xAAQSuGmqVjnq17tCZQ
	zlc1Z58FXpbY4c5SQPK3DcXUtTipxemPIlEyRrc0fqaqnp5yMMtpNpPaH3N/YkIwAjCebn6FPsn
	pN+eHSwKDislzs2o65dkiJO6fm1+kbtkjoLZt4az60/WsVyiMeLkygfFn88tiVhpdixwHM667ne
	MpTlWTupc8qDcDgTiF4neqgdh1t4Qaf9gggy9zZukmtkY2YkbfR9fDWDbBYpscRroNi2wprHbnJ
	0RwiI2dlAYzjUhlEQQC2G88226yxMPBL/M87NSN+bUCPyVVfvO1GKiIvLq1KVB4xv/FGxqAHP9u
	rlpMKddqJh3T9kai5LztSd9U2hlArP+eVQB+cy47NCDGxeB33jvit8sMJe+QUKakWhYMPtBkPFn
	jOUnfVEusfFP9odyAqM2hZKOZFzkBxfI9fKJJ2lvYHLYvhC+VkIYuTiy+5zlRZKsG/a4r0aQSp6
	duS54BS8uD+rOWI28GRSNVwoF2MQpsx5RVN+XTpW/lP5+BTCZh4esr5hcnCruBfQp3w3HtQkHYf
	IX8IRqhK0uNBIzuVOU3EkwTgDwvCSLkw4N0PlkOfdmGUAa0Ywr4h6pPvURreN/IxLBnmu8pWAxQ
	4ACNDTsR0hxVhhijC+N+U03B483AiL4DmXsdgfh5fSyEvKC0p9gN6uKbuK0zodAWEBNfvg9bcVT
	JIDls=
X-Received: by 2002:a05:600c:64c7:b0:4bb:68c4:2044 with SMTP id 5b1f17b1804b1-4bb887fe725mr6329465e9.11.1795110610075;
        Thu, 19 Nov 2026 09:50:10 -0800 (PST)
Received: from localhost (2a02-1810-b422-d400-611-84c9-252f-74ad.ip6.access.telenet.be. [2a02:1810:b422:d400:611:84c9:252f:74ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm68993685e9.13.2026.11.19.09.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:50:09 -0800 (PST)
From: Arthur Heymans <arthur@aheymans.xyz>
To: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org,
	Solomon Peachy <pizza@shaftnet.org>,
	linux-kernel@vger.kernel.org,
	Arthur Heymans <arthur@aheymans.xyz>
Subject: [PATCH wireless-next 02/10] wifi: cw1200: check SDD element lengths before reading them
Date: Thu, 19 Nov 2026 18:49:54 +0100
Message-ID: <20261119175002.458988-3-arthur@aheymans.xyz>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119175002.458988-1-arthur@aheymans.xyz>
References: <20261119175002.458988-1-arthur@aheymans.xyz>
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

SDD elements have byte alignment. Read the PTA and reference clock
fields with get_unaligned_le16() and reject short elements instead of
using incomplete board configuration data.

Prepared with OpenAI Codex.

Fixes: a910e4a94f69 ("cw1200: add driver for the ST-E CW1100 & CW1200 WLAN chipsets")
Signed-off-by: Arthur Heymans <arthur@aheymans.xyz>
---
 drivers/net/wireless/st/cw1200/sta.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/st/cw1200/sta.c b/drivers/net/wireless/st/cw1200/sta.c
index 5d8eaa700779..db9f0c4a07aa 100644
--- a/drivers/net/wireless/st/cw1200/sta.c
+++ b/drivers/net/wireless/st/cw1200/sta.c
@@ -11,6 +11,7 @@
 #include <linux/firmware.h>
 #include <linux/module.h>
 #include <linux/etherdevice.h>
+#include <linux/unaligned.h>
 
 #include "cw1200.h"
 #include "sta.h"
@@ -1072,28 +1073,34 @@ static int cw1200_parse_sdd_file(struct cw1200_common *priv)
 	while (p + 2 <= priv->sdd->data + priv->sdd->size) {
 		if (p + p[1] + 2 > priv->sdd->data + priv->sdd->size) {
 			pr_warn("Malformed sdd structure\n");
-			return -1;
+			return -EINVAL;
 		}
 		switch (p[0]) {
 		case SDD_PTA_CFG_ELT_ID: {
 			u16 v;
+
 			if (p[1] < 4) {
 				pr_warn("SDD_PTA_CFG_ELT_ID malformed\n");
-				ret = -1;
-				break;
+				return -EINVAL;
 			}
-			v = le16_to_cpu(*((__le16 *)(p + 2)));
+			v = get_unaligned_le16(p + 2);
 			if (!v)  /* non-zero means this is enabled */
 				break;
 
-			v = le16_to_cpu(*((__le16 *)(p + 4)));
+			v = get_unaligned_le16(p + 4);
 			priv->conf_listen_interval = (v >> 7) & 0x1F;
 			pr_debug("PTA found; Listen Interval %d\n",
 				 priv->conf_listen_interval);
 			break;
 		}
 		case SDD_REFERENCE_FREQUENCY_ELT_ID: {
-			u16 clk = le16_to_cpu(*((__le16 *)(p + 2)));
+			u16 clk;
+
+			if (p[1] < sizeof(clk)) {
+				pr_warn("SDD reference frequency malformed\n");
+				return -EINVAL;
+			}
+			clk = get_unaligned_le16(p + 2);
 			if (clk != priv->hw_refclk)
 				pr_warn("SDD file doesn't match configured refclk (%d vs %d)\n",
 					clk, priv->hw_refclk);
@@ -1147,7 +1154,12 @@ int cw1200_setup_mac(struct cw1200_common *priv)
 			pr_err("Can't load sdd file %s.\n", priv->sdd_path);
 			return ret;
 		}
-		cw1200_parse_sdd_file(priv);
+		ret = cw1200_parse_sdd_file(priv);
+		if (ret) {
+			release_firmware(priv->sdd);
+			priv->sdd = NULL;
+			return ret;
+		}
 	}
 
 	cfg.dpdData = priv->sdd->data;
-- 
2.56.0

