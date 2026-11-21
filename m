Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.0
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795281367;
	b=M3jfDgLkENAXjJebEAwc2rCQbWKNDIL05GIdrOH9eHJemZVXQ/S2cVtMW7gLFH4bAtsI
	 SN0TWXWJU0VJsKkdK7230zJ4YWguE6vXTHQEN9f6nRtuG2toH4U4gSVFW12Af9nWl97t/
	 fYAYCOs9XiQ/Ach/fOb3fcCsLFXiBGrFu1dhEg8TnQnkO7pw+8aGszuPFyz4CwftTpd+y
	 RS8XMkLNypUXGCZhASlXjK8nz8w4n8sg9/d80wurJRysFSs0fLQnuQAg1VzCDSLQVfQoV
	 bEddqID4Q1mOErTxSohWT3MxLYk+GHyjFmBvXyyVmTPiVBIAm9PQfNO1fTo+JYFvdzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795281367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=YeMemw7z3zkrZgQdMLY4+GZ8sJMULo49HzUbi5WBgXg=;
	b=aWt0JjUic4AXvcdPY2vq3bHdAeqY7FtnI8arxOoXUuvYHyqEbr1TSMyncmay+XVB1VPn
	 /+9rsOvQM9EJvHeycdNbIdZw0PcKtpiRWW/P473/wMpuM+8Jx0Lgk0JULNA642qREzt8J
	 8lqdFqUxlVzGTZ/Cj3RxO8T7izoWAeagoGLC8GGC2Ihm3RlkpPVI9EEnX3ouHeA0Ufmkb
	 vQmWKFwgss1QAtvl5EBC4hNVI2sNs2YUbfGivgbTIpHOH2bAwaDMOddpYAJT0Tht9E5oG
	 KfX2KAvvCkRQ+a1JpyXAHuqWHZgsvE/7j72E/gXo7mx4S/V6E6pASwS9Bgf/uAZ5wEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wGDc0lBY;
	arc=none smtp.remote-ip=74.125.229.0
Received: from mail-dy2-f0.google.com (mail-dy2-f0.google.com [74.125.229.0])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF830606A320
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 17:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF830606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wGDc0lBY
Received: by mail-dy2-f0.google.com with SMTP id 5a478bee46e88-3117f9b9e64so197784eec.0
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 09:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795281366; x=1795886166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YeMemw7z3zkrZgQdMLY4+GZ8sJMULo49HzUbi5WBgXg=;
        b=wGDc0lBYGMLNqVMOrpCd7OwIYxmfQVKgrW78HLjyJ/anzGWJdwQQVZa6RNQVlZ3iC3
         GIbE4Js4Of1xkFB4NcTmSYeGVdbKjturW1hupFBhfZNCdX5ySzVZHabq2im0KcbTtXuX
         6eFDQR4EgePCbxzkzGospHkQuIGNY0t9BAUDhdMEAnFI/lRhfOJLm4Fj0XsGACkLV0+y
         hMyKLK2AzIAx4dMkFlIhvo4z1+UkFuAGNgl33xyTz3fSLhAvm65JNqF0g1lsYqBTCGDu
         30wNmQr3yJ5fyxq9ekZEOv31RWvB8NeWUwWAOz6jrt512oPTylg9RfbU1pwLOHTKNYIy
         VAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795281366; x=1795886166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YeMemw7z3zkrZgQdMLY4+GZ8sJMULo49HzUbi5WBgXg=;
        b=P40pDS+ZBusUHryjz1INbdpTi/LqrI8kuBcdHgLRHWVeei6WG8fGHdpjvlm6cIbfKI
         Jz8YhD7J4gNBggwH4cp7fJxI2D59OKe+mAYG7xMKl/s/BY7x8MPzA7Lp4qvZ3vxXfqOD
         SgBDJipJF2TSIwMYk8Iy+uW5OzG7wcQ6+HFX7WtP3tJTF0/GwAgGaXwRZOmWIGMqoGw0
         9Bik2R705kpwMjFdurYUgXO4x3gV29SWnaMVVzW/8VIwUF3nmydEis5X2ZklFFZNMIIn
         4mt/JL44Az2EpTMPOailiW55uqfj0wpH6SPuz+LJLTPjRZZXVqjJhkDIp1gcuOmcvnEU
         QD/g==
X-Gm-Message-State: APuU4Z/L/2a/ML1HGQhTsLJrhPF4o14nnzkmUMxSx+5KD+FbPdurZTmK
	iW+nqP+5yIFghw0tjLfIfSYjQSLNvQOMBkMT5C3DsbQQF9+f1zykgSI=
X-Gm-Gg: AZFdTZdR0WpaIuqb2mUtihmqnF3TZBSpHQ3JvrJV2GJ6ENWuVwnJ4e3D1oDiTWLn4u7
	2csma8Aquwg3WpqLbn2weRiOa/r8QDDMtEXQJkAJbUuDuIEblTl/OlgAgqLP3q86S2TZQe0MusS
	bqkg5EtztIpJh5WG9ex6LuRY8a7QWPxy7Dvbbulq06OiRoFa8ONZVw5BfqPgsBA52buJ6CW4g/2
	g8OlQjVOo6FB5s3fDu0QsGAoA8vgZ0ru1Wb7ieKjC954Bd4rjmZa33lwn5Zc5h+Z4PZjDHDKRMS
	g2KAUnQdJwDZzR8CA/os+MkNAbLeKQtgheqiBzh8m774fw+a6KSU3dWxmTTohW3VvHjQRqqkS10
	aswWUyqs4CAyJqwEm9XVMb7NA+trrYzu4sGOtYwxsegmDqwE2LpyuYPOFuT5Q5mmjj3qWif+Ff1
	ud8vWppBrUwDxDCTGShy7rUQ/XiOd3qAzW3leUjhVE92cfsHs0iKed1Dw6Y8x42eT13Yk0MCl9l
	Z4Qj4NzRPYYdTmx3/kc9SjnX2p/0vo0vnU+C8clbKFe2bdVawwKzwuvQSGO7W7H7WOUksu5waVF
	/DwWm9YSkoZNElbTiUpjhShH3bVeSwhCairGWEA=
X-Received: by 2002:a05:7301:fd07:b0:36d:be15:2dd6 with SMTP id 5a478bee46e88-38570844f7cmr6701963eec.11.1795281365872;
        Sat, 21 Nov 2026 09:16:05 -0800 (PST)
Received: from archlinux ([2405:201:ac01:5300:df48:a6ff:13cf:24ab])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3866f299d0bsm12537988eec.19.2026.11.21.09.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:16:05 -0800 (PST)
From: Anvik Loitongbam <permissiontogallop@gmail.com>
To: Jes Sorensen <Jes.Sorensen@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	Anvik Loitongbam <permissiontogallop@gmail.com>
Subject: [PATCH] wifi: rtl8xxxu: validate firmware size before parsing
Date: Sat, 21 Nov 2026 22:35:59 +0530
Message-ID: <20261121170559.149274-1-permissiontogallop@gmail.com>
X-Mailer: git-send-email 2.56.1
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

rtl8xxxu_load_firmware() copies fw->size bytes and then subtracts the
fixed firmware header size from fw->size without checking that the file
is large enough.  A short firmware file with a valid signature makes
fw_size wrap to a huge size_t; the revision logging then reads the
header fields out of bounds, and the download path derives an
out-of-bounds data pointer.

A 2-byte rtlwifi/rtl8192eu_nic.bin containing the 0x92c0 signature,
loaded while the driver probes a Foxin RTL8192EU (0bda:818b) passed
through to a KASAN guest, reproduces it:

  BUG: KASAN: slab-out-of-bounds in rtl8xxxu_load_firmware+0x238/0x2ae
  Read of size 1
  ...
  The buggy address is located 4 bytes to the right of
  allocated 2-byte region
  ...
  kmemdup_noprof
  rtl8xxxu_load_firmware
  rtl8192eu_load_firmware
  rtl8xxxu_probe

Reject firmware smaller than struct rtl8xxxu_firmware_header before
copying or parsing it.  With this change the probe fails with -EINVAL
and KASAN reports nothing.

The issue and the initial fix were tested on a Foxin
RTL8192EU (0bda:818b) passed through to a KASAN guest.
I would be happy to provide the reproducer on request.

Fixes: 26f1fad29ad9 ("New driver: rtl8xxxu (mac80211)")
Signed-off-by: Anvik Loitongbam <permissiontogallop@gmail.com>
---

diff --git a/drivers/net/wireless/realtek/rtl8xxxu/core.c b/drivers/net/wireless/realtek/rtl8xxxu/core.c
index 3d0c22db30a8..c85b746c8e4e 100644
--- a/drivers/net/wireless/realtek/rtl8xxxu/core.c
+++ b/drivers/net/wireless/realtek/rtl8xxxu/core.c
@@ -2124,6 +2124,11 @@ int rtl8xxxu_load_firmware(struct rtl8xxxu_priv *priv, const char *fw_name)
 		goto exit;
 	}
 
+	if (fw->size < sizeof(struct rtl8xxxu_firmware_header)) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
 	priv->fw_data = kmemdup(fw->data, fw->size, GFP_KERNEL);
 	if (!priv->fw_data) {
 		ret = -ENOMEM;
