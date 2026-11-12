Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481466;
	b=jjUIrfygp96YLnO0g3IpsIp+MYjoSA1wHcX9JlRGIQ1zF18xYyTdqpsDeh7u45q3/+fr
	 qVbU+D7bRa8EH9mta+FXAYJHdYumN4LVtgiVDLsLXPqChhR/grsPHGJiffUDsWLJECMHz
	 Nl886aHVdJhq8uQYwUyiF2vsXHgv9s8gR8bwzyjonbGkg8grcmVKKI5YbpNvjfBqivQQl
	 rLvReMzTKkZA4Y0smdClmu8Ydz+JmO7SciVrojUj7EpUqc2MZpry1bCthAoZHIQQk1KK9
	 TL16yfLRAzMnMHc+s0LY8dz/mJA7bw/ERtwpll7DmsuNlId2mGkb8jSt23B2xD9H1fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=p4nfBH0ON7Tagwi81J2nyaY4CDROHtzvnVy5cWouAZs=;
	b=2meAZ+Q7j7QmOg+MPq8ne7+99H11x3156v7uGDKwTR3hHfHSksuk9sfokDbqR3BcbNIz
	 ITfq0pA3l93BgC9oYKtexDb1VvAH3+AwAO5wbGU2yt7OOCNB7rTC9oZaPuKKvFcda2Lku
	 VZB4PoCiERacEwkHmJE6X8fwYCIiMXzCgUzSrODZa9tERVx81jI/22janmGQR261Ipjyq
	 12Ys+baNvXIGrbaAvxPWd76zU80vACb17Z6WXPQ95UD/+xbuyAL7mLz/nkESzu4qCp3LX
	 0M/sPWGyh+hPW2++GfRBhN0kVssmVXWDuirn0PAj+wb+tdSGN2zn0kxiXWVjtdiG9jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K4nAGMhz;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E53606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46E53606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K4nAGMhz
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so2475509f8f.0
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 03:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794481465; x=1795086265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p4nfBH0ON7Tagwi81J2nyaY4CDROHtzvnVy5cWouAZs=;
        b=K4nAGMhzSnjp1VIxIV2lewniaDIfRXC2Bd1sE8udoTX5xagxZWQmY6CcgKR2lQ7Qhj
         GYzOZdVXavP0783TliHNP8iDHBQ6d7QpErHuhn8iwOXqWSKIO5dmGlb+bdN/A/NLPUex
         oa8ZNKam5lHG1RqHPBFLFZaJJYZ11vUVqwjtlDyW2G0eSr0oInjDupReluHcWMOzxmQE
         1H74+s4+c6+RyHU3ngMM+1Ix2KeoJTYf+bIFgESsh/+1O7kAzVQoWsWMbp9b2DmvuSOs
         Lb5+7zoYnb9cxfeoOe4xAM87D2rX1bgVDdHXBxdbvmmBO0YBLofslzHaMyIB4P2d29V3
         uLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794481465; x=1795086265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p4nfBH0ON7Tagwi81J2nyaY4CDROHtzvnVy5cWouAZs=;
        b=awIeHNTJkTG7IIejEPkN/y/khxy+dd/kAkUsr6jxDsclgwDeej23Jvt3SGxV4R6FnD
         EoeEEyNVLUi9ZPoYpgtE0nqB9ZembA08xUElPdEnkaMd5cXWg/GKoMGdhEBVmEGIrJTV
         m5Ne+nh3X7ExLhYXU0iV2TD/aQqRgP4WY8OKxrdOVjNd4sMB2GRzuu1/laJ4ts1HOG2T
         dvftrqMhK8jD5TTlB+xiIuTCqf/LFt2F2Ap58LkynouRdQMy6rPVCQY2YgF6cF2AEUf9
         NZRUy6E5h/P+QX7P05tYOcgMHkC+dbGd02PRjxBRLF1KR29c31Bl64cHHHf2CHg1/Eur
         1w2Q==
X-Forwarded-Encrypted: i=1; AL+hErEaLHTesd6MoQPClxCR4lRjraJwPGeOcq5it9PtkX8ey4BVWVxn9ybMLNtY5iBfVKjDwCxTTXEvc5Z7gSkV+w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8aamg3roHjANfe+4Ll07Z6oIfg1G+rWx63Cxgc6/MIwxqPphWz
	9ckj7wgJDUa9ID5dEGTGgoDcBKCIsBw2nzzUxpBcdLEQ6LjD2MwFsFau
X-Gm-Gg: AYBFou1jrdW2YT3gp+5pS/JeDzaFS8yQbzJMz+MycZ4xbdPzewIuAiTOISrGIqiJAwX
	oDo2t4OiXx9XrySjYd0sZxYgqrfx7j7QdQebuH10mOvCT/qcz2XMHiqAehw2EZCNssmLPjUg/Tl
	YFmjGE6vuWAM5/WR8JdBSPQbw+gKGVlqPJLq+p/tLHheRDs2bp/2fqhXwpTtNFjijrvU6Y9IkJO
	46TBpaJzhS1zAiLtn8o+zPtnvSYV+t/8dmMB09sh1L3b0BAlsFrLacQzfdQUkZlJeJskg/eSHWi
	h4WaNlOdE3CUQKrHZCFzt2ZJ5rLFU7TsgAH5DetazQ+y+6Q9DezhNMUKF+KT3Nk63WGtzGsX7Em
	nUMoirc5XSvubxKapXAk9O6f2pzqQgzrQh9/TDvkjUwZmxnn8/+VxZjT2mfrO89kYdeuloxZdKc
	4ZkI590rtSJgvOg+sUL0Yz3kbRsoSWUTWc9r6ID5IDrSjEaJU+G/JWGXj/nDBbITP9r5hYuDNR4
	EUf4oWuHAaYVcZr7kSx1CTvsEd6mLVXn0vdkq3yRnNAMAQxYiGfQsFrJJ9HzOZqumKFMSfY52A4
	8KVmBVbodtEUvl3w6/BU+55c2K8YUgo5oS0Obnqb6xhUAzf9sBeKKAJY
X-Received: by 2002:a05:600c:470d:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4ba09380609mr99011215e9.24.1794481464499;
        Thu, 12 Nov 2026 03:04:24 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c990sm15301961f8f.3.2026.11.12.03.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:04:24 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: ath12k: WCN7880 firmware "NOC ERROR DETECTED" crash during the boot in resume
Date: Thu, 12 Nov 2026 13:04:12 +0200
Message-ID: <20261112110412.1941-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
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

Hi,

The firmware of the WCN7880 in my tablet sometimes crashes while it
boots during a resume from s2idle. The driver side is covered by the
series at [1]; this mail is about the crash itself, in case it is known
or somebody with the firmware sources can tell what it is.

Platform:
- OnePlus Pad 3, SM8750, WCN7880 hw2.0 (PCI 17cb:110e, chip_id 0x2,
  chip_family 0x4, board_id 0xff, soc_id 0x40210200)
- v7.3-rc5 plus board patches. ath12k does not support this chip
  upstream; I run it with an out-of-tree patch that adds it as a
  WCN7850 derivative
- firmware from the device's stock image:
  WLAN.GNG.1.0-03342-QCAGNGSWPL_V1.0_V2.0_SILICONZ-1.81206.153
  (fw_version 0x10097fff, build timestamp 2025-11-18 09:48)
- no WoWLAN: ath12k_core_suspend_late() powers the device down and
  ath12k_core_resume_early() boots the firmware again

What happens
------------
In 1 of 64 and in 1 of 240 suspend/resume cycles the firmware goes to
RDDM early in that boot. Both times the crash reason of the firmware
is the same:

  NOC_error_patched.c:437:0x8NOC ERROR DETECTED.

I have seen this crash reason only on the boot in resume. With WoWLAN
enabled the device is not powered down in suspend and there is no such
boot.

Questions
---------
1. Is this a known firmware problem, and is there a firmware for the
   WCN7880 newer than the one above?
2. Can anybody tell what the firmware accesses when it reports this?
   If it is a block that needs a clock or a power rail the host is
   responsible for during the boot, I can check that side on this
   board.
3. Is there anything the host should do differently before it boots
   the firmware in resume (a delay after power up, a reset sequence)
   that the WCN7850 does not need?

Thanks,
Vladyslav

I used an AI assistant (Claude) for the analysis and to draft this
report; I reviewed the result and ran the tests on my device.

[1] https://lore.kernel.org/all/20261112110008.1229-1-tvlad744@gmail.com/
