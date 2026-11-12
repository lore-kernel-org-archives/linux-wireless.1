Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501966;
	b=0ahQPjce2PK9i4hwZ6g1YrZzwp+vmFrZFrLsN00Bo63z/c4JnRtvijtSc6jiFwFpCTCc
	 4qo7CUVNW5LSJk5PujYO9jG5ZOaPZcyKuvWtX17kdUWe4pGGDsZ8FtPPOevp4swUOww0J
	 UOfPZgqrTU7SnP/t2Ug70CZHwyLiiO5TH0Nb4OyJt3hdg9NlLeCVH4nSwDCYvdvyUaFpm
	 ybra2pNmNx+x1jSXNVGFDKeHRBrZE7vMlusZJvkkwGbo6fLft6su1B+bgRj1n32tCqebG
	 ZdZTod5Dz4yaIAogtctAEUhoKMKwcO6ooH3Buy9G68Q1bXAt/2ao1U6faDI9B+yL2Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=tfzQxxWeLzH5F3hwJGBP8SJilKA+fkDjCsVxJYymu8E=;
	b=Fm3TKip6KXCWVNAq7UmZzwGYkmGh4cm+B+3i2Shn8vD4NSklZkwHbcOj3HhHdLskA1X/
	 o27JS7C/FtmwBPbyS3WW1KyoP4YExPaCNm2KWT+FuaASFFqfJ/rvCudZ+gwj7pYq1jOQf
	 kTJ3sv6KQ5w01WO1OkZemYzcYb3xOhYr3Bb1Wr3TpGPT67XqUUoViZGwvAohrHv9D+oYU
	 MQz9KWyUB+Kp6MDC/OyaRklHc4+9awJLjVgnOwAb5o/2YkReYn0np1Iuom4GKVV+eZba7
	 GMywprgYVZzNIisd9aaO/hZP27Aue20ch78z0Z76QitIBgwklI5x6T7XAT/xiL0JJQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C3co+VPB;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C754E606A321
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 16:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C754E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C3co+VPB
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso6289591c88.1
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 08:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501965; x=1795106765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tfzQxxWeLzH5F3hwJGBP8SJilKA+fkDjCsVxJYymu8E=;
        b=C3co+VPBMXdVur0EJSiLbqAe5jcOgIJABG1p6mnKkCjuDx5ArRZPpzqXInQsdWQkjw
         62y63T7mJfEgh3fTGRbq6GDjXE8n3yVCcuWLrqA18UxdEXleLUFyTXQl/hW2cGv2e5bc
         cdgFE1TTc/FfcYymWoiBYuc56TSo6+B8x8lulUvcAqU19MkTCSBSAeR0CB10de1iwm1e
         hifvSfAD5+IFLk1K3J5AhI04SvtFyCDjHOohvume8jMh8nu7TBhhc2Z3MLPK6l6Rezr0
         aM4BkniVOGiqiS88qQ5abqpsM5rsAI2AzjW1OVq64irnbEhCR4EDCM26Mc0Mt5tdmMcB
         Zj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501965; x=1795106765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tfzQxxWeLzH5F3hwJGBP8SJilKA+fkDjCsVxJYymu8E=;
        b=OnKxXrHlEnS9p7yOHdJjly5/GycivPICTlpFkp2KOZ+XtJszQu5VTqB7oHU0ZIwtwd
         O4fScpI9rAcKA6aGvVDfobe9r0WqzYgKtsGv0kmd0QjP9vDGRDnoYL02gHTvzUeRxMU+
         3Qsvhnh1SqP2ePymr9fdVBQ4YvGgciGfs5w0bYXWamhH5cLYKQ7nt0iIkgv4+FbknENj
         DXi8rCNrrBdLH3szlhpR61d5tgU6hBFVk9IVxrc5iHZtbISMbdXFlhxZvMVFvhvzfoOA
         8EKbKk4ZQHHr2Zsg2SS4UpbnEKQ9p2oeDzceAd77LjccIASpu71NlKggzvr/rvXYRHLO
         Jsnw==
X-Gm-Message-State: APuU4Z/zFS7XCJgyV7gUmttJwIMgIF72nt5f7q5rW3VgxeDBR2sBvWRn
	COUUKNGgC4yz1qTfFz9woIpFbymtJBPdjrAQl7x19pDRP9OAtA71JsUKGTMRhDI+
X-Gm-Gg: AYBFou03L/XtE8+upitkeV+wVkDOZrnogFY0Vb0bJjHGiD1ICdjBzzIqzpwdM2ZLhm2
	FlfAiEBwUrANdMvHHWrcP4KK/1Qyfi1yoMPWv9CC+KZiahys82ckyr5QO7rdC1LdEnWq5l43oHD
	APOOP49T5uPQLrDOiLhjwv1pQaNm8ilcK871dlI1m1cNs7iTdytK4svrjAr8IjzrerCKmbh/WGe
	9I9rR5jCajk9Cvcao+54e/tSN0XiI2JqXQm1qzI+jTq44wC33Zq29AHYHQ1127Eac+P/R8PKk9A
	qYvgfyCioWuVg7DbYMlaixlavrPys/M5+mQrYXcftHulH2UOVlCv/uR9eIZmQZuKIkr4sa0bDe6
	2scv/u+N9hv5vomkCpfl7JgnTPpGUS7H8Ou+QmDI8IjRtKI17VErAw3B6uaJFlIPoBpkPUZ+8Jm
	uPo8fMgepeMrgvX03HVdUHp84hEEO9Wq+MlglqZ9OTWGgXrBKKbc0iYt5CMOG321IVzqZ+2FVif
	SslHk6AiKyoxuHHr1HdtXwAR0Mut7t8d/X1KZJL54EFUWB1T1uOGzh04P7Jtw8Jro1ZSgBO5c1J
	pLfCqPCqd48kEQZ/u1N2CsAqYexFJVwS95w+s8TBCiRPtkl2cAu7FaF5uM14g8R2ADPZiHT3vUg
	E4nccpbdJUPx2hu+a/mYBpd+lts0ZRBVJKNZ9egkeAdVs
X-Received: by 2002:a05:7022:ea24:b0:1a9:e382:cedc with SMTP id a92af1059eb24-1b5030fb905mr111453c88.46.1794501964586;
        Thu, 12 Nov 2026 08:46:04 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:2c54:4647:b67e:c94c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm287090c88.0.2026.11.12.08.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:46:03 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH wireless-next v3 0/7] wifi: rt2x00: improve the throughput of rt2800usb
Date: Fri, 13 Nov 2026 00:45:34 +0800
Message-ID: <20261112164544.3176458-1-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
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

This series improves the throughput of rt2800usb.

Implements
- Frequency offset calibration
- Better fallback rates
- Aggregation
- GRO

Tested on WNDA4100 RT3593, 5 GHz with iperf3

  patch                          before        after
                                 TX    RX      TX    RX
  2 crystal calibration          27.7  31.6    28.5  69.7
  3 MCS16 to MCS8 TX status      27.0  70.0    29.4  70.0
  5 RX bulk aggregation          30.5  67.8    30.5  80.9
  7 threaded NAPI with GRO       30.5  80.9    30.5  161.7

RT3070 did not have any visible change for both TX and RX.

Patch 5 added WARN_ON_ONCE to get_rx_seg_len, but it will always
trigger due to a bug due to USB data toggle. The fix will be sent
in another patch.

Changes in v3:
- Crystal calibration: save the frequency offset of the beacons in
  rt2x00lib_rxdone_skb() instead of fill_rxdone, through rxdesc
- RX aggregation: enable it for usb_maxpacket >= 512
- GRO: Add locking and reference mt76 on how it is done

Changes since v2:
- Correct the link tuner start and stop conditions
- Extend fallback and MCS retry calculation to all devices with 3 TX chains
- Remove TX AMSDU and fast-xmit

Ho Jie Feng (7):
  wifi: rt2x00: start the link tuner when an interface is added
  wifi: rt2800: calibrate the crystal of RT3593 with the beacons
  wifi: rt2800: make MCS 16 fall back to MCS 8 on devices with 3 TX
    chains
  wifi: rt2800: don't report an A-MPDU length to minstrel_ht
  wifi: rt2800usb: enable RX bulk aggregation
  wifi: rt2800: support A-MSDU in A-MPDU
  wifi: rt2x00usb: use a threaded NAPI with GRO for RX

 drivers/net/wireless/ralink/rt2x00/rt2800.h   |   1 +
 .../net/wireless/ralink/rt2x00/rt2800lib.c    |  89 +++++++++-
 .../net/wireless/ralink/rt2x00/rt2800lib.h    |   1 +
 .../net/wireless/ralink/rt2x00/rt2800usb.c    |  33 +++-
 .../net/wireless/ralink/rt2x00/rt2800usb.h    |   6 +
 drivers/net/wireless/ralink/rt2x00/rt2x00.h   |  37 ++++-
 .../net/wireless/ralink/rt2x00/rt2x00dev.c    | 152 ++++++++++++++----
 .../net/wireless/ralink/rt2x00/rt2x00lib.h    |   2 +
 .../net/wireless/ralink/rt2x00/rt2x00link.c   |  10 ++
 .../net/wireless/ralink/rt2x00/rt2x00mac.c    |  13 ++
 .../net/wireless/ralink/rt2x00/rt2x00mmio.c   |   2 +-
 .../net/wireless/ralink/rt2x00/rt2x00queue.h  |   5 +
 .../net/wireless/ralink/rt2x00/rt2x00usb.c    |  62 +++++--
 13 files changed, 365 insertions(+), 48 deletions(-)


base-commit: 3c311bf321442d4c4f452a1a08bc9efce242a1f9
-- 
2.53.0

