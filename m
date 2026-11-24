Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486667;
	b=jskz2yxyMqhjxsGYzu1qt63Ur6cnkEHxc9EC2uWdbHxiWZiafvTWimiQTs6DX8ScjBHW
	 sCp2GNS6dd0bNcLS2depIltr85Slw7sRdGPAtbyzCTTL8pU3rZz4XRZV0Wfe6LMHSZJTv
	 qIu8pwuSsHbD+o+Zt0H3gIOYc36mvrYzGvwGfFgsdsdWnORA6WzUkHqOQxtSEaCf5WlrC
	 gzJg5DuP8mqPCidB0WvcmAlmsLsr8WcEzgMzLkZC1FKVkydvN3LvpB27w9/11Ewf0rqiW
	 ptCknyWrorZqiH46ZRcan491PCNtwskaFfF0ae9sk/7OHsaVbiFFbdAXXV/gbIof63g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=4mYa0VMJdDE9fIyEhSr0hjnjYrzdVICDltC34NkQu9c=;
	b=boTiPhNFSFFF39RXG1e8kuvNrRD60gxHSk60FupvnFZbYeSJYkuEF7TInJmB5NUgg+9n
	 YdG/297EBJMFqTig3yRz6aBZgz2tL9wqXQtBcH373JxU0cY7yaZw6+/o12dZ8HbAwDGGR
	 FdBQCR3KZjoit8hRViuQGwBRr+bEeTSeGOxZD8Ta88GGxkmtHdQEQzl0P1+dWX3xFhIp9
	 nYGSdDcFjYS1SPVudUdoDIWo7NNKRivqOM2SjzL8fgspVMGEc/4jxhtps8SsxIz7EG22X
	 wtrOCzertR4X8isTU7X7KXeWfhWCmYj5HftNpqPizQp7uAf+f3Tb1aL+TJaIS3r91Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dMEHWWaE;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9494A606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 02:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9494A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dMEHWWaE
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f04ad2c46dso21942005ad.2
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 18:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1795486666; x=1796091466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4mYa0VMJdDE9fIyEhSr0hjnjYrzdVICDltC34NkQu9c=;
        b=dMEHWWaEbh1j+x8fkZIhF2PS3oFYXCkU4Pnum3B4LdVMFag4ny3Ur0ZEIhJR1TA3fC
         2RdqmVXBr72wUMOK8qoDLi3YOFoZL74NnkIZzneNC7MduHmJI4JX2Eq0oM2MNQWGDYj4
         NvloInvMqnh3hT42vTFt86HLxnsuxYSWNXvCHllxgPclKweVCGgdmukzlEkK8v71jKlV
         U8jCRcThknXREotXZBERXkekVZ2JJqg/PAbJgiLvTDa/tjDCxx3fdMHUg2hTPVvOOg65
         D6/CoiUtwVc2jGDIuCfnI7y8E04V/N4JG/u49f1497B0gAuNG2o92Mwfqv6Ht5jnJ0z9
         OcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795486666; x=1796091466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4mYa0VMJdDE9fIyEhSr0hjnjYrzdVICDltC34NkQu9c=;
        b=FxrizJlhNnnpFZWe1WMfNxE5W3srmK4PGG6obtfnTvgXJtLbUUR+/d8eb5jWHErX9+
         GvGtxhKVguZGA/W5i2JT/LMABZHHmBbD2aViu8F+d3DZWdR3cijAhzGn2mG0L4U8z8Ke
         Ggd9k9n2V/1yrlQ04BMgP4UwiXb6Uk6HODshSARmUfD4vZQgSA/PjiUU/7jRhRUrnvYf
         S0SbUQ1gSl6v3/dKMqQf4XVxAA2is6+I1ABs5Qfa+VnDnQSDLdI+JTWE/Ytd5i/6MhEO
         UURYMgYwziskMRGvynoTuUXySfkMec15FWrZoqq4VCHZW/r336Avlclyx7eLTUvyvyac
         1mgg==
X-Gm-Message-State: APuU4Z9holmdXrGGfkv53/2TG7/2xpeVZkc305eq/lw9txsQ8a/iu4f5
	KHrfmE7OIoPFrU6IUTVzdq/9Odxd75TUcVhW8Fm5U43doIdOkLiOqcyIT7VFoFF39ZQ=
X-Gm-Gg: AZFdTZcedpGqFPUMiYvZu1GVZJBplF6wF5tTwGpTIkUTIGXzfmRbBj8qGqMC8tZOvPM
	Ng71zgt2gTwwASobhkmLdyCc2S1apNsg6r/ff+o7HJBtjYszkEFSYBKXQtni/oLpSXTKHksTjex
	MU1OYv/GpE9Noy5jGRPzwoaD1N1/dZtJD171gOhMXI+KwZd2CCYOh0MmiIFrGDqSqx0FfOxb03h
	9Oi3Ug6oXdZUSy0mlHdVik79DmlzQG12GEsVVbEq40siDFwsIoDtTYiuSGwPc4RvJeQuFKMBsty
	qFkYxvY6uW7N6ltQ5RtyXSFg5BTSpFRXwXZi3MafOPLhbbFYU3+YPj64VJ9uaGbamXQTzth+a0X
	aVHezChPlP7DQuxfpZYob1/PLgB53qUvEMZnixqup6y9Knxco+D0NjGBKvw0i1Y5AEJPJkDsVWw
	QAHqbl8p5/oVPiTGRqSZwRwSRwRXh2N7M5YZvTvmwLwY/sFtQSPkl3wxIiWVjsNpkiJ6sNZ2/lq
	eR/dPHY5eNvCAcss6gc7Rsa221JvtpTAqUfMySBdkYenI1iEU/s0tOHoxET0bhW7KQzfS3wzJPL
	gtg+FDS1ZA6r3hM+Bei+wEkCWsY48o6Ql7dfu9el9ymOt3Ke5KC09HCCyz5RTXhEwxlwP4pz9lQ
	CbbZmLB4kxmvOZd5H6fioIG6nfUH1mBmkBV304GQpPEQkLCw=
X-Received: by 2002:a17:903:2b0f:b0:2ed:cb6b:8b96 with SMTP id d9443c01a7336-2f03f1971c1mr125598005ad.23.1795486665890;
        Mon, 23 Nov 2026 18:17:45 -0800 (PST)
Received: from mma-H9MHD44.sydney.mm.lcl (60-242-93-14.static.tpgi.com.au. [60.242.93.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b58fce71sm7798645ad.45.2026.11.23.18.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:17:45 -0800 (PST)
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	dan.callaghan@morsemicro.com,
	arien.judge@morsemicro.com,
	Lachlan Hodges <lachlan.hodges@morsemicro.com>
Subject: [PATCH wireless-next] MAINTAINERS: wifi: add git tree for mm81x driver
Date: Tue, 24 Nov 2026 13:17:33 +1100
Message-ID: <20261124021733.653141-1-lachlan.hodges@morsemicro.com>
X-Mailer: git-send-email 2.43.0
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

Add a T: entry for the git tree used to manage the mm81x driver.

Signed-off-by: Lachlan Hodges <lachlan.hodges@morsemicro.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0cf311e6c4be..6657eb5d0b7c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18928,6 +18928,7 @@ M:	Dan Callaghan <dan.callaghan@morsemicro.com>
 R:	Arien Judge <arien.judge@morsemicro.com>
 L:	linux-wireless@vger.kernel.org
 S:	Supported
+T:	git https://github.com/MorseMicro/linux-wireless.git
 F:	drivers/net/wireless/morsemicro/
 
 MOST(R) TECHNOLOGY DRIVER
-- 
2.43.0

