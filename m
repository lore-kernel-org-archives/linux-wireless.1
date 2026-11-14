Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794694865;
	b=R0HG5x0Y3y3Jkta0iOY1N7hTyJMu7QVc7kYyhHKV2Z4QCg05xde8VgKsxU8Ji0DqkS1Q
	 vzrpc/s7wPwSZ8QvDg5UryVLE25aP7jjSUnhdBxxUb0uX9i3+CG9bEd+msx/De0r9s6hb
	 dwr+R9pHIcYUkp0YJMq/I27qyJH5gr+uxzu4T0jYXgH/Vjjp7xZ5AIPX5E5n9YzOWjlro
	 sJ9IUzY6g/WytAru60DusrEhBEOOX7pRB5Tp5kt9YihjuqfO4vIet6SS1WRqy/o/QqyU3
	 J+MqeZ8MjsdKvhRhnHtWicn71lgh7BOd2rfYZPAs2jFMhvctzYNlbaTD+UrkhaaP4jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D/lcEoG8SzzM6dCHzIQ7cKV185X11yB2lBIT1K3NOMs=;
	b=uaBwvHPIlJGN5BDyQt1CMcTiJt9o/nGyAt8IzFid+51d/A4Izl9pOBp3dM85qeORblUD
	 4u9j/2L/eENohy4q6/Dfzunh8i/f8tH/Duv0B4Fb22SSYJ6FfezVOM1SdEwrQyC+jUPBW
	 cT80jkB6SQgixk0ZHPuztKtfIigjbhJBHlEtwcgnMS4PgPrRiKvPbgTJdxsl4QYwgiQ1C
	 YFj/oiUW6EjogNs9Ca7IcvenmWMjMIvQy8a9bCphPTD3VIoH6k0MDS/CzKYAAMFdYN5NC
	 ZQLkDSEBAuaeXuV/lV2uQMW8Bvag0cz7M05U9AgbgK5r5BTscgZhoLiFNlO9iV7PWzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=grCm89YS;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3071606A33D
	for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 22:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3071606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=grCm89YS
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so377896666b.2
        for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 14:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794694863; x=1795299663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/lcEoG8SzzM6dCHzIQ7cKV185X11yB2lBIT1K3NOMs=;
        b=grCm89YSafaKGhWHnbOdmcBQQMZBIzYtfm8nDeinL992rgXWB/pbuEntRX0jIrmrrX
         PHPfahVC3Ti+Fa1TevXOwpId57jZnGIJefsfetN4UjrB9bA961MYSexkIPrhrfEKcDKj
         DezlwCmJSKLJnEwCvikf7MrIRP3SNxqQafscYjLeT/yRuc04XmsrWnu00so378umfqBS
         czPjwEJF1q5C4QhzpiuHehLA+ge7iWAxFmvtnrRKB8A78W2llyzjAxWxHaQNc6W8XhIy
         bmXk79wbXHULh/YcSC2jtTbS2+ajIbemmdnyP+5UXWySIGfqB45UUINNIk6ppQylJqO1
         5OAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694863; x=1795299663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D/lcEoG8SzzM6dCHzIQ7cKV185X11yB2lBIT1K3NOMs=;
        b=Vc07T5jYE7J0sWuV2qxqYm5PsaLD4GwYanl6dvyXFQ4kFI104FoyMBf4tBQ+he4yhR
         QhBrHg3XEtSTpDxvtX8VJrkdBE6MVUtue/DAOZVw20iloq8aprk+0Ih1gj/Ei0BCH23i
         YYqH0PtwgLGtDnisqwZ/6YrKyBeEvic2LqwYA0k+Mhdx1IGvbNDLmYHKU89JSR+hp64m
         w3m+Yo52/JCiossc/a50glutuKq4xHDuwEynqUNt6EXzbPxGPtqH6dJS2VpEG3uN2wFm
         fOUcUYxzG8Sn/88w4tjnApbtouFiaBt3q1sCH0YtxZMw+duFBMqeog7/HWpF7Sm3FpG2
         S4EA==
X-Forwarded-Encrypted: i=1; AL+hErHKlM3Hj5kzyOjUXZw5CjdxyP8yef+Too9SvYrzNHkfxVhkOxejpKoxy1vc6PSpu3sYTq7dfuqdAMZ6Uve8bA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9DKsgekBBDGyCcz4JvKLxMmXeyVDV2/ONeXr2TmUWIgHcW3WWn
	sFJ0js6Fnu59JKipWTuMrzJaxd8Z8FyXLlo7LK3gF//kfLeMOWNFVbops4WibMhBDxS5Yxh51DX
	awA/xzQ==
X-Gm-Gg: AYBFou3yud5Wqhy/g2dUYxQCaWdqJ1rNCbqbbnJKLw39M7bE1vhQ4ThScdSP17ig5I4
	cJZkwnSdcCUA+W9TtXLOchxCsMS3kexAA1sIOVtHLT5rO0eyx/jD8+A4Mat9wvRTqXiaqtqlhm4
	wao7tuZ1V2E+uVQHjJGyznKFm/yZ8clTap2/sEvFctrhhoicETR2/VyQhfWnqLSUd7MFQqRgps9
	zXU3EituJAcZS7EoipB1CjdSl3i4kOGmD6UzlKTnRCJYGcmKrrm0DuDeY+SBW3dvCIb+LXHczGG
	Wvcl3uKtmFmRYlJBCrj89dmg5+D8hr/CXXK8oaMBi7y1E3zmUE3f5dwl/R4h77gOtDqM561K5DN
	wIljSTJUnufOn+uhhcs2SSVTjG53Gre69NZwpiT6M/YXnrt8tPwL8dham8jVR2l0AEKHN4kWHGl
	4c+JyMJ4nJruoZBWCJ0nV4FlJQc30W6j/8O8cSD4eL9/SQjTI1wTMfHGY4qnYUYpyNa8ps5N1g+
	cQTRLKEs30GsxqhyYr6wO2zKdfV2DDGS4+IOX626WPuCIioCqy3A6n40bJZS949zAi927QSfh/d
	YDv83v5rrurazqOYexnJBxfh2EjKu8ePxcDhitNA72a4Ayx4emHehryLR2OeMyWiyJST3a7Wum/
	ACIAxHaJf8rXxPTeQ8dm+/jBjAJViCyVYdmLGsE9tU/msNJIxYLJt7YXEL8IeNBcHdYAhETWcHu
	ejHlJ79F38LYalN07uA0geOuNtudDIakNnfsf7a3qLCy5USIdqWBH5mfHtG9+F2P93147cJMe0G
	iKDpwQedupJzl83uSqtgP/FDG0UQvU2uOfqQeSBH+MExsWQ/vdodNwrkH8Niv5rZBZ/Gg4QvgDR
	MD8bOiCm/TbJEaVl78Gu3fGt1E1ggzTDpniX1pb60iPt8aStxkCSsUMWR8iMu9Qd
X-Received: by 2002:a17:907:a909:b0:c46:7ec3:fde2 with SMTP id a640c23a62f3a-c50963777b8mr508487166b.11.1794694862973;
        Sat, 14 Nov 2026 14:21:02 -0800 (PST)
Received: from Desktop.fritz.box (p200300f24709d9006da21e9e53ecde1c.dip0.t-ipconnect.de. [2003:f2:4709:d900:6da2:1e9e:53ec:de1c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b1fsm255612966b.21.2026.11.14.14.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:21:01 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 1/2] wifi: ath11k: request firmware-2.bin directly
Date: Sat, 14 Nov 2026 23:20:57 +0100
Message-ID: <20261114222058.184034-2-julius@bairaktaris.de>
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

ath11k requests the optional firmware-2.bin with
firmware_request_nowarn() and uses API 1 when the request fails.
firmware_request_nowarn() only silences the kernel's warning. It does
not set FW_OPT_NOFALLBACK_SYSFS, so with
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y, as OpenWrt sets, the lookup of
a missing file falls back to sysfs and sends a firmware uevent. OpenWrt's
procd hotplug handler answers it and logs "Could not find firmware
/lib/firmware/ath11k/IPQ8074/hw2.0/firmware-2.bin: No such file or
directory" each time the driver loads on an IPQ8074 device that ships no
firmware-2.bin.

Request the file with request_firmware_direct(), which sets
FW_OPT_NOFALLBACK_SYSFS, so a missing file is not passed to user space.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460

Closes: https://github.com/openwrt/openwrt/issues/24743
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- target ath-next in the subject
- name the code path that produces the message and why request_firmware_direct() avoids it
- drop the Assisted-by trailer
- rebased on ath-next 1be6c8d3027d, no code change
- new 2/2: ath12k has the same pattern (Rameshkumar Sundaram's request to fix ath12k alongside ath11k)

v1: https://lore.kernel.org/all/20260910071838.1983652-1-julius@bairaktaris.de/

 drivers/net/wireless/ath/ath11k/fw.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/fw.c b/drivers/net/wireless/ath/ath11k/fw.c
index ef1b4c81843a..88ec2ffd9f00 100644
--- a/drivers/net/wireless/ath/ath11k/fw.c
+++ b/drivers/net/wireless/ath/ath11k/fw.c
@@ -16,10 +16,12 @@ static int ath11k_fw_request_firmware_api_n(struct ath11k_base *ab,
 	struct ath11k_fw_ie *hdr;
 	const u8 *data;
 	__le32 *timestamp;
+	char path[100];
 
-	ab->fw.fw = ath11k_core_firmware_request(ab, name);
-	if (IS_ERR(ab->fw.fw)) {
-		ret = PTR_ERR(ab->fw.fw);
+	ath11k_core_create_firmware_path(ab, name, path, sizeof(path));
+
+	ret = request_firmware_direct(&ab->fw.fw, path, ab->dev);
+	if (ret) {
 		ath11k_dbg(ab, ATH11K_DBG_BOOT, "failed to load %s: %d\n", name, ret);
 		ab->fw.fw = NULL;
 		return ret;
-- 
2.53.0

