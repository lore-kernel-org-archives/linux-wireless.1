Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699902;
	b=YH2DWENqaBe8gqSu9gNj5oySsnrY8bJ0iVnZ+sOj0VG0O11elSqpcZq+P9rnkCpPUjj4
	 EqU8iRIJK5YJ/tCkASdvY8LssYePEAtmwKBOjNwVxzrcmN7+ED0+2rxQTvP2mhZRbHfrg
	 aWHsm1Td5oShO1M19SV43ky49kwmw/LiPCdz0hov7RkzTzV4kYyGYMc1dhElitRjRcx0B
	 50c0HcFg3NEPARi4bMwmJOBS/5VsK5p5MfAlFRfxD2xegUfbPuXRSyEVJOFffxyaOEAog
	 OVby19d14vxeSnSy1ZdTxMSZK4RnzeruPIPh3XPSq5zHzAmaorO6sNTDwdLrtr3CH4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4bpLkGggKND4rdI5aeb1fC1YriisxypN5V4Ha9pY8nc=;
	b=xW4Gs4/48fZK2xwDG/wunGf2v2fshrtMXZ6fOb71fIVw5bNZ0zIdyurgE4Ufy6viefLb
	 Q3rA35dZeFF53FEial7ymnVy4v6IhWIZ4PTqb9Gv7EQ3whSwSXEqDFVweFiSVW2XtpUO5
	 qbaB7PHEzCF9XdBPYmWrOIYrC6CLfWbxwI1YznwVjhyYfPIEqVbvtpDzSg9Hstc8KFKRd
	 ndBgghACcmYCDgSR3sZdW8BL1H5tSotM11jJXQWTS1KVORaBu1J4jf201X4L9TltrPtq5
	 ZoBmvoiX4YVkEdDUAS5fdo4rXDDk0rNZ2K0lBZ0ql9jas21N+a33IwDKbAERIrpI/0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ex4MPbIQ;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06AE606A335
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 13:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A06AE606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ex4MPbIQ
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-380c28f9e35so8005085eec.1
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 05:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795699901; x=1796304701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4bpLkGggKND4rdI5aeb1fC1YriisxypN5V4Ha9pY8nc=;
        b=Ex4MPbIQnlsBn7GAG4/VCuSYs61TCmhayVVfq0Y2vPPT1s2YO2jM1Wo16z1gICrh8C
         gk0/EROp+S/tI22esTQi/MuxCWTZHMtMv7Y19sYaiRE27ynUhlKUBUI0LrW8lGbHvU8w
         WOXbaSFDHR843eYyhcdP0O0oioe2SiAynDEpEefqLDL9o1N6K3IxwKxRMl5b2DiUr4WG
         ByMLICKpZAmRIpHEN7UOAMOIbNKLjP4oNQvhwBTxkr3DpG7AmgkJC+KUMNQjMJ3s6yTX
         zfFVYGyUdGAwQp/TVxPLn217yeFpHpXE2MjJYOOmM5JbYDaO78rrvt75w59X4j3I9yE7
         7+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699901; x=1796304701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4bpLkGggKND4rdI5aeb1fC1YriisxypN5V4Ha9pY8nc=;
        b=0kjk5chf1TtTLKQ917fwICc9ZPU+YZuUNNgf5YxtD1Aa6MdayGREPs89ZNpnCagaw4
         mmVC+EeMAVpM/aYUxrLLIekpWADe4KeS5ZOl4ffnLD7hkbbEJ5TBulhM7/JJVxdl6sNM
         7duZf/Te9MgIyAqf/kYdODzyqJTuEAO1h778TH5q5N6x5UrKRo8QaqUtKT03Zgd0wpE2
         jci0pwjqDKH6Pgnovq3Mn/EwdwA6rRqjPzA86v/3AB4qqon27Yr/iWKEQaas7mcFnIht
         t7QYdTKr/yJGdteZlL4MgO5rm+fFHRjyaSGhGTp7/E7cq+hS9OFTKOd1w0AzUPYrwlu2
         xbZw==
X-Forwarded-Encrypted: i=1; AL+hErF1riu4rvuAgvtHhTLq0zepP8M8pKyyyD4Q0ZZmD4nKFgsfTyya5GRmQ4cJAkc2nO71thSxsherW8ULSqx7/Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Zg3ocRZBSiQjaI7fgnVl3XK6boOBezztw6erQK3AnnXdWLlL6
	6WL7+9TVgjdo1Uc7xcudk15+U24NjEQMb3WBKOlkdBC1fraqo6g3B3w=
X-Gm-Gg: AZFdTZdyXHYk6B0Soia3D1ThmmOFpJZH5rLdKUbnnfVSfz6TUE5aE9eD0Gr6mjDmBj2
	2IRnheMRFFMYHEiYcALhfDX09xqtGlhEHKCEjMYiQ4EPst9pihy+mVDFnWasad1DkLgQX4ACjXm
	9R0jbermzdVA37TxF7Xjm+EDZ+BqCq3yxS+WjQzwv9/GVEHoIp9c7tOL7VQr7i+fcSxAC5JafSl
	ZNCyrPFE5/dPdTRq3xyzRZRPbIHI6h+kJNySH2iKLZW5NF0mdgMuN4riWtRRwjDgJVXpDLdJfZn
	WB6a+7++x5QPxtv3ZWPPNP++d7jQZS4tyMiZTt0geovGYitc3L3PVCaFkDm9hBFpW9sqafhSun6
	bIOpvo7/jbuaoWr+YFYMHR3lCJViSmqychz9ePZl0qZk1+gOGJK5ahZNQonhnvaA/D/BhEmQNoO
	vC73QM6CCinsI9a5ME5K9KsUw9ciWJUgFj0Gu0Bv9X7dnXAEQlmv6TT8AaGAd43RW2UDfl8adXg
	6sgJ7ROvQXV2Kv18m3PQqFnlVtWwnfx0/80E8tXh6ABO0OSbmRbHyKCO+FAx4Pr+orcMAA9Fe0h
	E/CtXEoihiIj6hUfAaBus74pec8WKjwtzy55AeRjzH7gytkDkqXSj4cRMQm7+W+MQmuzSTK/17O
	I41UQ+IiyxJcQ
X-Received: by 2002:a05:693c:20ce:20b0:381:761b:f335 with SMTP id 5a478bee46e88-3856f94eda0mr22296290eec.6.1795699900556;
        Thu, 26 Nov 2026 05:31:40 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm50244649eec.1.2026.11.26.05.31.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 05:31:40 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] bcma: Release the found cores when the bus scan fails
Date: Thu, 26 Nov 2026 21:31:36 +0800
Message-ID: <rc-b1-20261110-vc-96-1d8d0afe258d@gmail.com>
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

bcma_bus_scan() initializes each core it finds with bcma_prepare_core()
and links it on bus->cores. If a later EROM entry is malformed, or an
allocation or ioremap() fails, the scan returns an error with those
cores still linked, and neither host cleans them up:
bcma_host_pci_probe() jumps past bcma_unregister_cores() and frees the
bus, and bcma_host_soc_probe() only unmaps its MMIO window.

Each failed probe therefore leaks the device reference of every core
found so far, and with it the core, its name and, on SoC hosts, its
ioremap() mappings. The Sashiko AI review reported this as a
pre-existing issue in October 2026; an unmerged patch by Haotian Zhang
from August 2026 would have covered the SoC path as a side effect.

Release the cores in bcma_bus_scan() when it fails, with put_device()
as bcma_unregister_cores() does for cores that were never registered,
and reset bus->nr_cores so the bus is not treated as already scanned.
put_device() is the right release only since commit b63aed3ff195
("bcma: Fix memory leak for internally-handled cores"), which made
bcma_prepare_core() call device_initialize().

Fixes: 8369ae33b705 ("bcma: add Broadcom specific AMBA bus driver")
Cc: stable@vger.kernel.org # 5.15.x
Link: https://patchwork.kernel.org/project/linux-wireless/patch/20260813100836.2913-1-vulab@iscas.ac.cn/
Link: https://sashiko.dev/#/patchset/87897
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, aarch64-linux-gnu-gcc 14.2.0, W=1, COMPILE_TEST=y, BCMA=m, BCMA_HOST_PCI=y, BCMA_HOST_SOC=y, OF_DYNAMIC=y; drivers/bcma/{main,scan}.o built before and after, no new warnings.
No hardware or runtime test was performed.

Needs bcma_bus_scan() to fail after at least one core was found: a malformed EROM entry, or an allocation/ioremap() failure.

 drivers/bcma/scan.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/bcma/scan.c b/drivers/bcma/scan.c
index 84742408a59c..6aea15f54b30 100644
--- a/drivers/bcma/scan.c
+++ b/drivers/bcma/scan.c
@@ -520,5 +520,16 @@ int bcma_bus_scan(struct bcma_bus *bus)
 	if (bus->hosttype == BCMA_HOSTTYPE_SOC)
 		iounmap(eromptr);
 
+	if (err) {
+		struct bcma_device *core, *tmp;
+
+		/* Release the cores found before the failure */
+		list_for_each_entry_safe(core, tmp, &bus->cores, list) {
+			list_del(&core->list);
+			put_device(&core->dev);
+		}
+		bus->nr_cores = 0;
+	}
+
 	return err;
 }

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
