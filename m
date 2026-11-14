Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794694866;
	b=ayw32dBgioznG0LYyhVT+BXLp6d+pvOhOvAVZYoWEGXw1n8PI2btFgEGYzVSQrN+hCxY
	 OtWPY5mLKhpAJXscfdkBWR4+03G5SA3bxsoVyJePtRkVY35QHYS5JLPZXNInk3FDh9KIb
	 AVZmoj0Wajq/Sr/HfVoosmcz57eI8GNMLydAfs31ezKeTBWGHSAiW1XAzWIE/qzG0Kg4y
	 q8u2bx1CNCJKGT83tGqI7ZpW9ok9XYDzpZbLlBVGsbevP2uxWeR897vXNO9Q3D7WOZ4gX
	 RsJVqTfIQKh8AaWBNjwXwFAEZKawyjqEU+E9z7n58KOItpBhVeukixQwuj9FY6BpGCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PgNMIqtoqnJsAK2y3DPQyuTYuIaiwX8FKfGaxN4/bPo=;
	b=2zI0a23+wkcr47qv0Z6em+KogHG6uuvKy9rTRKPwB37rrzsegW/85Bofcu6W3naJd8X7
	 8FqD764SIiOf17Auh57U7dHnZgf744K6eu4/gOYmNj6og8CQBMoTCa47lm06ELuj5PQ+9
	 AhX3GEX+HWK2+Je2p8Z6FxYYIV8Qy/Su2MFBhpA9gIvaEpqwOMGr4B6kmR1w7ogdkAkLh
	 V4i7C9fce7ERRKzdmQLkVlvfmkYA7Fl4Ld6gD2OansK5Wkzzq263AtfcUvnjR9aFU0meZ
	 LhhrutMwzuL2GgenJ5eBnqHXIQbDCmKK0T92lGx67Z4MGMS+vlFFz2eA0uX93OR1mEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=cHBFjP8U;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7766606A88F
	for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 22:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7766606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=cHBFjP8U
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso487537966b.0
        for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 14:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794694864; x=1795299664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PgNMIqtoqnJsAK2y3DPQyuTYuIaiwX8FKfGaxN4/bPo=;
        b=cHBFjP8U3dEZKylbHQyrhREgxJY4psaggAq8ElzGT7A44EkqkaEgeQBbC4ZtH7U0V1
         K/aiY7NUofodpOJCR1GPOwY+5LyODVcIeLDI5015iloHAL3w7KrpT9onQdC1NOJ3IdJJ
         4ZhW6RnyDAgnK/Qpj+tBqOTAr7CWNGMAqQQjB9rVxFGu7g/UtPLEceS1iWyJN+oanint
         ELtpbhWpiVOAvzGibirjxbBQz0oV7Fl5ABw/fKPy/oyJFziOoib4+sJ0JhILXD3ldOVX
         dRkdcM91v/7JnsRGUJTWm3NVsZFrN5k3SKv9OZOsMgd40z/RrMStJ7+/hVebPI9nJ3wk
         /PoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694864; x=1795299664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PgNMIqtoqnJsAK2y3DPQyuTYuIaiwX8FKfGaxN4/bPo=;
        b=Pd9P4FepGPreq82Zu7XXRkCLGq0hXKUn0EQv6S0ve74/gOMr0hWL1ortgZt/mIdpU/
         wxIGedB7K1dMq5Vy5D++9ePg04d7aRCP5p/SwEzd7HA7RoNk8WGTU6LGR424tdzORrgt
         WCHIdP755IvpHnj7tp93v2nyoraWuzNnYosfCgN0t8f/XWPfWD9T9FpBN/8++hJIwTWJ
         MPdCgbFleutT52r/GyEL3xM91jH2WN9DqrLs6fgDEReUQKxBK6OjUWBPLgpr0eTTYEBA
         xdv7tqnsfIXB51/p5tFgqm5x6mQ4KQnbZp6W7ABmez2jcCR5q3BnMIkVLGf77/SHR8Nh
         NzJg==
X-Forwarded-Encrypted: i=1; AL+hErEQqokhnBFWUsLeKxJjRHWsZXjuSGUejg7wCO/+TKRQZFhjM492HCWV2oGnCTUT0gHqQQV8TIg5bO6a6URdOA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8F7X2y1AxwZRjR2SohH7IHz3qROVZNKC2Vyb+HPn3XbBScmk8n
	9XeoLL8e9L+uh2RNUFE5qDu0Pi+a/WB51k8+KJ2PaT77krBvVfl7HirR+OpmvGyH4Q==
X-Gm-Gg: AYBFou0M4UuFwn8mPYYFWEMZCH7W7obXZ9ykeUmWKWus8NYSG1R4AfFrB1TrSUw6IhO
	/8fCrgs6TrDbx84kNhlh+vbRS9bKa2zp/0963H9ZdTp8Wh1Q0BQyaPe+8f38B1Cd0W7TQknq48a
	m0LLE7KvSyIPmhaCv//XiCYc10g7TeJHSwKHf/hn51PcsQbqcoE29RXK8uBugOpDl6LZM7ajeZZ
	jRRQtIUbdFSqqRss+RufajNKREIRUAeDODRMMe+JYObzpc0OYBQmGelWAu/4vh6AXxnZOqbMQVy
	cveQx9eQTk6m1DWKhS4YN4DXuDYKrzwCIhyMGqJPQ44PVSn+H+qzTtcDN+Os9seIES6YFzrJ5Cg
	MAFPmFIDImE4rWtDL4ZrK28dApm1YM4T6KTMtBphKQqZGqpsZjThzr/xZ3fnuWuJZ/PL7HRL2YQ
	P/+5gR7KDD9J9RGWSMwTHKWd4u9LD88EMTRmpFPECS8WFYc8zGcnp+0+n7MMXWi/qMhproCxVa+
	4Kq4o3V2OOzxM/TQLLsj/q5bKJysqLTk80hiZp3jzdnBPSu5MPT33uPVBCN5jQR2TXUb8SJCyb8
	JMdnSSEG9LK+Cs6r6i1MN0U/tHJ6In6qHLmaHc50D+yJxtRlL3D60G0H++rwpfxZGM/dAp8+bgy
	Mw+pXbxxjhv39bvjBOmCX+V/wZkyu3+yhznFKwkSeXjGS989WEnWJLoZQiq1pf3Y9uysjJn8VuF
	JJMG+5vEMzJS361RWRpYALJTjnpDkPu6HokXJvtF+qLIyx1fp5xWNgr1kbJpneHhTGvAKBEr5sV
	S/uNxK9HPbbHjai6JXQ35JvmcU1FIhlJLZ+SOcMswYauoxsh2ZuhTrRrrIiZ8LWIzikkQ9tQ6hM
	R711XJqrwfiUXWskn3F21V3QeI0yKvASNY3eZHq3yauw40BrBJzM3kd9XKy7zqjS
X-Received: by 2002:a17:906:f5a0:b0:c46:d493:47be with SMTP id a640c23a62f3a-c50963bba24mr513799866b.19.1794694864369;
        Sat, 14 Nov 2026 14:21:04 -0800 (PST)
Received: from Desktop.fritz.box (p200300f24709d9006da21e9e53ecde1c.dip0.t-ipconnect.de. [2003:f2:4709:d900:6da2:1e9e:53ec:de1c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b1fsm255612966b.21.2026.11.14.14.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:21:03 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 2/2] wifi: ath12k: request firmware-2.bin directly
Date: Sat, 14 Nov 2026 23:20:58 +0100
Message-ID: <20261114222058.184034-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114222058.184034-1-julius@bairaktaris.de>
References: <20261114222058.184034-1-julius@bairaktaris.de>
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

ath12k requests the optional firmware-2.bin with
firmware_request_nowarn() and uses API 1 when the request fails.
firmware_request_nowarn() only silences the kernel's warning. It does
not set FW_OPT_NOFALLBACK_SYSFS, so with
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y the lookup of a missing file
falls back to sysfs and sends a firmware uevent, which user space such
as OpenWrt's procd hotplug handler reports as a missing firmware file.

Request the file with request_firmware_direct(), which sets
FW_OPT_NOFALLBACK_SYSFS, so a missing file is not passed to user space.
This is the same change as for ath11k.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- target ath-next in the subject
- name the code path that produces the message and why request_firmware_direct() avoids it
- drop the Assisted-by trailer
- rebased on ath-next 1be6c8d3027d, no code change
- new patch, same change for ath12k

v1: https://lore.kernel.org/all/20260910071838.1983652-1-julius@bairaktaris.de/

 drivers/net/wireless/ath/ath12k/fw.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/fw.c b/drivers/net/wireless/ath/ath12k/fw.c
index 22074653cbb8..842830d2bfa3 100644
--- a/drivers/net/wireless/ath/ath12k/fw.c
+++ b/drivers/net/wireless/ath/ath12k/fw.c
@@ -15,10 +15,12 @@ static int ath12k_fw_request_firmware_api_n(struct ath12k_base *ab,
 	struct ath12k_fw_ie *hdr;
 	const u8 *data;
 	__le32 *timestamp;
+	char path[100];
 
-	ab->fw.fw = ath12k_core_firmware_request(ab, name);
-	if (IS_ERR(ab->fw.fw)) {
-		ret = PTR_ERR(ab->fw.fw);
+	ath12k_core_create_firmware_path(ab, name, path, sizeof(path));
+
+	ret = request_firmware_direct(&ab->fw.fw, path, ab->dev);
+	if (ret) {
 		ath12k_dbg(ab, ATH12K_DBG_BOOT, "failed to load %s: %d\n", name, ret);
 		ab->fw.fw = NULL;
 		return ret;
-- 
2.53.0

