Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593232;
	b=oJsx7HImMqjpdFSVIIVzZIkPE+oawv8qbZvzAy1NWjSZL31tJrm6KxO1mDdLSWzMJjdz
	 3WQQPa3ebO/yLIdEbx6etAUFTllS2022RG3hCD4EeQr9aQCXJ0diCmhc32cQz6E1joNKc
	 bCRuoF/QPWoeJ4AD1e9ZDLI9hIwCj4QoTH4qO0OfZAr4XdJTbycrGWwDjH+EBVdjAhpWB
	 +VpWRdMEiSz9yaaOa3ga8MKt1tckf2i96JOEqA1Ib3i7uOdhvglYDFfBWOwjk4u4Ccnze
	 o8tgnmxbA+HhaOLbuNO3Lz43cZBKfN8haXF1X2xENm87yfvjA/AyaLJ10V5/uTwr/Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U0564f1/wQ5vpUisl1vWxnDQHDxUALBKjxGcDAa3Zv0=;
	b=UViDuuJtHQRnvqMMmz3l6fCCZPPxNlg/G6S33E7O5qmSX3JcwTZI2yV9mb/p7Ard7mB9
	 V14SQAlQQTAcPQRj9Mdwogdy/ZFX+ghGhxNQxbugPcNHDkD9x/GNx5f0yckuYH8ZtVKAV
	 lq6owmvEOa5ZI+UKkz+4ZD1ohQxTphUg6XE+RStaI2QHaRi33n1HpbD71AUM2mfxPZ2tv
	 O7LtU5YJ6fFZ/GTqd16dkVs2CdldPOXPsM6op91LjXNa+jVTnRnVJ7Tg3KnRGoxznwGZz
	 dVG/KISu+Qru5Mswk7WOW7/rVI19e6+KvioG312NEsynoZme4zVGKoaepp5aKjHsvXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GL2G/tVj";
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223E0606A31E
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 07:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 223E0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GL2G/tVj
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd69954c755so3911743a12.3
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 23:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795593231; x=1796198031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U0564f1/wQ5vpUisl1vWxnDQHDxUALBKjxGcDAa3Zv0=;
        b=GL2G/tVjeRFiOoBQv+pcXwPzzo6knoBZR2QDzEuKIxXmpwCCnmgrHCp/dQEKS2RqgE
         pf5a7x0kHMOj2lpNTl4Sq7tNJlseTjSpxB+z1PqM0g+ZQmy4/o1rHqNn2HSYXfcoCLwI
         apJT8oGNx4yWJ+nCKErLHbVoC2dhUFZRXFPWSpkctcoW9XM5sgHmw3is4b5ZIKs/s/cz
         sit3qoQTAmUjGuejlKJxR2T+lowFqm1gJ0TA5JxAVRlO7SJNpSvXNbxsT1+ERbnBJlcr
         ktHApYxXYDm7izbhh4EAnKcFvwJgAMrP9UNQCOqCLQlPMY9Km4JOmqJ166XrLe1aJolZ
         zYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593231; x=1796198031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U0564f1/wQ5vpUisl1vWxnDQHDxUALBKjxGcDAa3Zv0=;
        b=pMpIqsWWDpwpl26DZRC4EbjaJl048hJqOncyDzDmyvXkBlk3t1g9DjvQbWlB0QZ68/
         rUbjktdBUzJgMlLbef6cCbHQJ7jrhGnB7G1/+ifYUm9OEKOcPSs7nGidlEpFLGhRDo0f
         VhBNeK8x1i5/c4z9EMr7Lr1yUj5bLW+rQo31qb8HXvBudi+Fa1e35nVEYemlsfzPAU4u
         wmHtMusee7e4rTOAZGsMte/sPeTMOVE+xQ1DjQGEBiEyg7Ng6K7D552WqdVJilRcMjB5
         65uoYZRIrRYdZZ3z5soeZcjp6T9S7V1MAG7goQzzFXao7bMDmDm4UfdO2sLiyDVB8DLV
         DX0A==
X-Forwarded-Encrypted: i=1; AL+hErGerojcLhioSvm15zs7johzaUrdtTAszhRIwa9fSG4r5qo/ndxweK5MGxe7o/aldZsdKsHj30FHd8fpXBbomQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9tq+Mb/tLBim+50WL6+3woMyg4sb623od+cJn/k4ZLhP8z9K0k
	lI+emTLJ2uH+4hZzms+8zq2mvb5vNMMas6TKNglmy7/jxb8UPD3shcc=
X-Gm-Gg: AZFdTZdu1AYJ3qSxGQ3H39wieL2gZqgN5hwv2oMree92ooz662jCmbNylY8k0mXVqZx
	5sPJ8M3WigZfMwPjvWqTEHh9qQVCSat7WxyIHGdMEg1rn8jEPAJqiDQ4lUK5D4Ua1x+mb7BKmpr
	ExL92CECno/BcXTXp1CbAVOfVzMgnQY+18pZBY13HHXcq5mY9bno/VBvC+m7EDGi0XJWQaIFwPL
	KEl09gglLXaAR8N3bV3iVFYkhfwrCi3B0jHsG/VZkUiIf/d4sDAlhOEV6xp/8C+Sisk8nBqx1K/
	SwSBebM4EMhAJMJ4pzvoJAVnbPUFnsF8gozRVf3IET/z3m9AuDDdrkcDntEslULLAAXO0FefWYQ
	D4rW5/7gS2/sRr2RQoJg33h4TTF2ldVXls8oqhFicFmJjGGQWVxAV+z12g6Sj7PzKjKiVPF6FlC
	vwUg2dW+oU2/eNLrjyPNSa4fNThhDyOk+aOAO3bbWq3PO9NODQKNguof9qXzfTkJTMemjfGSrhc
	rnE5Wof6HcCKFzpgK+7NW5++lHpYX9Wg3HIVnQGtvf95zltMZvlcDtjOYYPrZko/uR6juEwN7B3
	zlZUiQQFES0drjSFNU3BlH3dtVtCBvN1bZCSgNftPlQkEH/nJJatoxQOqQgFWfNzYwjAyw==
X-Received: by 2002:a17:90b:35d1:b0:3b0:9317:5842 with SMTP id 98e67ed59e1d1-3b41cb04e15mr16222267a91.48.1795593231485;
        Tue, 24 Nov 2026 23:53:51 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:44a2:4377:d176:9ad1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7c6513sm12347433a91.4.2026.11.24.23.53.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 23:53:50 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] bcma: Put the OF node of a core when the core is released
Date: Wed, 25 Nov 2026 15:53:45 +0800
Message-ID: <rc-b1-20261110-vc-179-09535b897585@gmail.com>
X-Mailer: git-send-email 2.50.1
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

bcma_of_find_child_device() returns the matching child from inside
for_each_child_of_node(), so it hands a counted reference to its
caller. bcma_of_fill_device() stores that node in core->dev.of_node,
but bcma_release_core_dev() never puts it, so each core matched to a
DT node leaks one device_node reference when it is released.

The node normally comes from the base device tree, and base-DT nodes
are never freed: of_node_release() frees only detached OF_DYNAMIC
nodes, i.e. overlay or changeset nodes. On a normal DT system the leak
therefore has no memory effect.

Drop the reference in the release callback, where the lifetime of
the core ends. The node is still assigned before device_add() and is
not changed afterwards.

Fixes: 2101e533f41a ("bcma: register bcma as device tree driver")
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, aarch64-linux-gnu-gcc 14.2.0, W=1, COMPILE_TEST=y, BCMA=m, BCMA_HOST_PCI=y, BCMA_HOST_SOC=y, OF_DYNAMIC=y; drivers/bcma/{main,scan}.o built before and after, no new warnings.
No hardware or runtime test was performed.
An AI assistant traced the OF node reference and helped draft the fix.

The leak needs a DT-described bcma bus (a "brcm,bus-axi" SoC host such as BCM4708/BCM53xx, or a DT node under a bcma PCI host) and happens when a matched core is released (bus unbind, module unload).

 drivers/bcma/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bcma/main.c b/drivers/bcma/main.c
index 72f045e6ed51..58d72580f09f 100644
--- a/drivers/bcma/main.c
+++ b/drivers/bcma/main.c
@@ -123,6 +123,7 @@ static void bcma_release_core_dev(struct device *dev)
 		iounmap(core->io_addr);
 	if (core->io_wrap)
 		iounmap(core->io_wrap);
+	of_node_put(dev->of_node);
 	kfree(core);
 }
 

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
