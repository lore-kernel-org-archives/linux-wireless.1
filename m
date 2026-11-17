Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935407;
	b=rOBu43Ikl70JNz602M8SEZvMShBS/972Ozv4FMiUux+UQvQWnUFxCVGyx6rFr22aPSAt
	 Ptvqz+ith1o3g2iIBTlmMd3qSw1pAj0NEwIDfMh66NxomI39GZcGkL7MB7GRSAsZFjF4l
	 qFqGiQTQfaMOap64jeFeFbzYRQVfHsqOaGr5hNCfICEC7ddTLazpABhQc/rAXP0HPHX0j
	 68/XmobyygeXsvdz6G2AFrdYJNuPa7qdcOxETFkdCboiIIHT4OFv0YI81sq025OZ8G1S9
	 yM/nNNzoj56U/SpgaJ+DkHRt7pfFNbbN4KVsoxv/SY1r15yVcgOx6wqBSJZTdyl1Srg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mQOCu5ETOup6h3/HztjN3vPu5TBUK7DFHy0vvQNh4oE=;
	b=jFAnmNUrJy+Dje0wMtJdRHggmFOFTS20XWc8OrnTzQqdg5Ne65z0AgZCkjQX/ljS+SpX
	 s+XXXjCgLTvCZkFhS6o+L8M9q9FhcdkCRWYrlEsPj3Y2gv5Ptr7xMPR4guwTgDwDrHaN8
	 NCzukzfnJxl5GR8gxpf2YOMLOefWOvOWJMcsOdqiD8Vs6rWVz43EagAwD6rNNk9XYtxwR
	 6AweSlOcj1IQLZsdhBxs5c9bvaOuYtFscgXt81DYonI1bmzSSTJzfxV7VsSxeTuriDjbI
	 qaEcu8jZFJW3+3tP+utXvbh/LrtRWdvA6bhCZrcI+Y6stlhfWoYqqfn9yGes0niARoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H6LU2jqS;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3AC606A882
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 17:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F3AC606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H6LU2jqS
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e46e449e8so3614843f8f.3
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 09:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935405; x=1795540205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mQOCu5ETOup6h3/HztjN3vPu5TBUK7DFHy0vvQNh4oE=;
        b=H6LU2jqS2OfceMaOeYPRgpY1POH8yUisEeG6yNEs91S7R/P7yH/VnNYvqn01rdDWfX
         uUAmtGS2ctAhALGf+q3zM5KiZVne3CaDGVkZFHvTHw+8oSWMjGNBXineTjJaXfZNQIDe
         O3zQNxQ2We6qm7aVw4XyRJW1I/cLHJ3mBrMlBsbWr6UdxGqDi+tI98ikengw3l4GIFNj
         8nz4dceu6ws7u72e+0kcJNFP5nE7MZGRNH4qU9u1gwi7hBra9OxOL/NZvMbyOsipphLV
         TtClhIRdTY0ybp/l5WlOFog0ICfDTbUpkD2v1xoqVBBSpOtCd21SjFJ2CxZhKfQX7De6
         hvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935405; x=1795540205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQOCu5ETOup6h3/HztjN3vPu5TBUK7DFHy0vvQNh4oE=;
        b=w9tIIo2qscLf5uCEjv4jg7EeuXyr7ldRQJkCdxd2zy0lhFRlQbqF2w2CjeD2QQOK41
         5rqBTY/jHs0NdxO8MzDtRnsqDwVnAk+vBIkvq/wz7QO8b/WduNf39gzYcSSx1IkiRPCE
         EmMKRqvzOnn0UZifzy7zvfRc9baPA+7q9wiv69kNIBKzPj/FLSOnyiMoDnkYrvs2VafD
         YphPW6+fLkQEyZ6GuuREZ4KgPTkaD+gpIzfxlta8utTiPjgKVU+jj5mroiZZAX0ZmaEA
         nIkbwqRfgpzceuYrdrd7r6XiVReP2qcsF/S1nHapItbu78bbTvpBveYpSPAPfnxdoCWo
         Apqg==
X-Forwarded-Encrypted: i=1; AL+hErGF5XUgahMnnxcw8DGRprJzIJOFaiYYWJfOxGxj0o6MJd4u1u8LZmrCwYXnOgwLemr48QFdSOYWHfaknT+M9g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8hj6KS+jrEibW9lwjOfCPKJ0gKQ++wTGyX7oXSkT3fiLaVxwuB
	r7wysL/pWujQq9yLAhO1Rrf04qMzVfV5JsjIX22Nhncva5FzBe/A6K84
X-Gm-Gg: AZFdTZcG1oH6TLGNMfDPyJwfe0x2MJJ7xRYABn4ZiWhEu+9ODUTy7K90oukb3Y130BA
	2qp0Mfti6iNVU8VYZW9NoiWulMv5DwMi6TIyFBfwWYzQBl/PFscZxp02osiNNsZKN/DtXn5eZdJ
	4mXYi+tYlrmnmr3uLFbcs9jHh0Z1LK0yszzZhexUmFoeSuq4csi2pqGyCqncKfwOFzY0dymzIKh
	eu5k3p6Nyu2sddC6lXKuFTxb+D5kEnbnJFYOoFtOBxFPOSHv1iBksoolFrR5Gf1t/dpv2kyoGLB
	UaGJy2Ws9109BTcclCX2NSFr/EG9yoKiWWabtqLSOhba/0jLU69ScW6XRvX/MEwqWvBWduiiiNj
	H31lePPF8AzoLa1JXZdlImPyEsHndtTCLNzwVEDOxMfhGOPTQIFLJvqfuXUXumbyWnayBVprEb3
	p4FjdqVahDjL6ajv4r/JPN7UZQKyRvalBzexCiIW0IpiduFbsepzfeQrmd3D2UEY/B62ur8/mBX
	qavjhG84obEoNoe0bzDDje7JGRC7R+1Q3G4tMsKP48p8q5hJX8sKOisb3DaNZunjLoNnsUSW5A9
	+essAwJzMINwqGAFo4HJ8HF/13UlGAgigYA=
X-Received: by 2002:a05:6000:299c:10b0:492:3176:3d64 with SMTP id ffacd0b85a97d-4a6332bcd05mr172893f8f.8.1794935405258;
        Tue, 17 Nov 2026 09:10:05 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6d079a2asm26828762f8f.16.2026.11.17.09.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:10:04 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v3 0/5] wifi: rtw88: fixes around the firmware recovery
Date: Tue, 17 Nov 2026 18:09:58 +0100
Message-ID: <20261117171003.1840491-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Fixes for what a firmware crash test showed on an RTL8822CE, and for
what Luka found in v2. Patches 3 and 5 are new.

Tested on rtw-next on an i.MX8MP board with PROVE_LOCKING,
DEBUG_ATOMIC_SLEEP, DEBUG_LIST and kmemleak, with hostapd. The firmware
crashes were triggered from debugfs on the RTL8822CE:

- patch 1: three crashes with an associated station interface lost
  five reserved pages before and none after; six crashes with an AP
  interface lost three before and none after. With a test build that
  holds the hardware restart for 4 s after the recovery, two hostapd
  update_beacon calls in that window warned "Should not have an empty
  reserved page" with v2 and did not with v3, and a beacon update work
  queued during the reconfiguration downloaded the pages with v3 where
  v2 skipped it (two runs each)
- patch 2: an unbind after the crashes warned "Have pending ack
  frames!" before and did not after. With a test build that drops
  every TX report of the firmware, the unbind of the RTL8822CE warned
  before; after, neither it nor the RTL8822BU did
- patch 3: a test build that leaves the station out of the collection
  during the recovery, as on a failed allocation, skipped its reset with
  v2; v3 has no allocation left to fail. Three crashes with a station
  pulling traffic: the station stayed, no list report
- patch 4: each of three crashes with an associated station gave the
  "sleeping function called from invalid context" report before and
  none did after; the link was back after every crash
- patch 5: with the AP stopped and its interface down in the same 4 s
  window, the flag stayed set and writing fw_crash returned
  -EINPROGRESS with v2; with v3 it was clear and a second crash
  recovered (two runs)

With the five patches, AP, association, power save, firmware crash and
scan tests on the RTL8822CE, RTL8822BU and RTL8821CU on both bands gave
no kernel report, and three crashes with an idle and an associated
station interface gave no kmemleak report.

v3:
- patch 1: no RTW_FLAG_RESTARTING test in the beacon update work; the
  page download and the page location H2C do nothing while no port is
  in use (Luka Gejak)
- patch 3: new, rtw_iterate_stas() cannot skip a station (Luka Gejak)
- patch 5: new, RTW_FLAG_RESTARTING is cleared when the device stops
  (Luka Gejak)
- patches 2 and 4: no change
- rebased on rtw-next

v2:
- patch 1: the beacon update work does nothing while
  RTW_FLAG_RESTARTING is set (Luka Gejak)
- patches 2 and 3: Reviewed-by Luka Gejak, no change
- rebased on rtw-next

v2: https://lore.kernel.org/linux-wireless/20261116072014.1142494-1-mehmet.fide@gmail.com/
v1: https://lore.kernel.org/linux-wireless/20261111213239.569224-1-mehmet.fide@gmail.com/

Mehmet Fide (5):
  wifi: rtw88: free the reserved pages of an interface on firmware
    recovery
  wifi: rtw88: report the frames purged from the TX report queue
  wifi: rtw88: do not drop stations when collecting them for an
    iteration
  wifi: rtw88: reset the stations outside of RCU on firmware recovery
  wifi: rtw88: clear the restart flag when the device is stopped

 drivers/net/wireless/realtek/rtw88/fw.c       |  6 +++++
 drivers/net/wireless/realtek/rtw88/mac80211.c |  1 +
 drivers/net/wireless/realtek/rtw88/main.c     |  8 +++----
 drivers/net/wireless/realtek/rtw88/main.h     |  1 +
 drivers/net/wireless/realtek/rtw88/tx.c       | 20 ++++++++++++----
 drivers/net/wireless/realtek/rtw88/tx.h       |  1 +
 drivers/net/wireless/realtek/rtw88/util.c     | 24 +++++--------------
 7 files changed, 34 insertions(+), 27 deletions(-)


base-commit: fb51e39dfaea5b5990e783e53c657534a37987d6
-- 
2.56.0

