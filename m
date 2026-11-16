Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813620;
	b=5NpSj+zcy9rUySNXwpAePyBFXpmtlwKltaodip5ujO/BGbrZ7EUAGWq4beQYGrk8MMsa
	 qFyYatqfEYbjtySNzMlIUbne9wbLzd0cdtPZviSs+PDxlAYoCTGBXlcPhgoqRx9j2c3DB
	 8P+MWpqOoIKd47HRFIuzVN39zZg3N6fgVGi2C+mm2h7GOVsrkhRpOF204Bw9zdBjMgPud
	 YPwIDnZM22X6I60nz+Gs+xTGoGjWTj2ltIi3nxkx8tcYsVyEboYlWcV9Z4KVzOOeaf3Fc
	 GU/3CcdG+SqwogDwtFxAWUxv0E60Hs+fG3SwVzAO2SVjw6oK+70I+6XxFeyQZEh6TaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QOYIpbJdkV1tnbOMqaWFb3IZHweOyEOHG6Y9Lq3iZWE=;
	b=vwVWKVJzMFLatJoLAMFg2k7WYqeOBSSe8l1ui1SKkhwdM30NfjtnugJhAHUhFBaMT5m/
	 TQGA32YpWIVfjj1cmEZnXhrM3WmbacufJQKIw4rMOxtIPsaVpqQzPC+rEdHAKDzyh+uaS
	 bo1NsYa0CuYmGFfBCo43IpOfZpZ+IbmI7ia6aZ5xnGuQJet6IurJkH/lxN9Xstin4C60P
	 DcBtsU8EqiPSYt4hWjhFrlbB5PmZEupDoIqXDFEDBeUT0nGnqLJXUFbeicJGT+tU4cnnt
	 olHTumexQa8em2H++fFFMtrKrX7DBWZxt7SglSgzHIquQ3xCijtZGOlASLhXV7yR36g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="n/MFUlEO";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5A6606A329
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 07:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E5A6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n/MFUlEO
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e47347279so1250891f8f.1
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 23:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794813617; x=1795418417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QOYIpbJdkV1tnbOMqaWFb3IZHweOyEOHG6Y9Lq3iZWE=;
        b=n/MFUlEOI8on7KQqVn2mh1KWDpHJU+9+7JNOlYEYC9uGnDumVBQsR8I9BeYG8IJxkj
         1Uq2es3UWn2TAJ2y/1GQ80FPHxlibkz3AjLZ0b1Ucx4mLfGTjV0zdzNj4GuzmyOYWipv
         Qv5OReVtuBrE0k7gZo+WeC6K5LJkFBcWA82xCT6Qnf0eAhwssOctoYaQAqmOelKSAvX1
         2qzocg9dOErHHk2043+Tbeg736O+HmoUpfQZQBiI0zr5hWuxBZFix60qcsbPnI2hT/Nw
         VFaWomjWh4vwHWftESAMNbsjZl7CTP3pJFPh8LUbKvyQ8wh2FhXhbqBLBwYMjbj24Rmd
         e3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794813617; x=1795418417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QOYIpbJdkV1tnbOMqaWFb3IZHweOyEOHG6Y9Lq3iZWE=;
        b=cTLiKR9wDbbNWpdh+mas96DRVFXz9RmgrXHoedGDKe8RsF+eykOOdrvJD+4zSd0AXE
         pKKAlrcI1ecQ/Ad0rpr+sQXqMoAMF/vFPs5hTTUxR18FBdetEpuZX5AQ709bcDaDNFLD
         XvORgels9k2ybEqPegsga7cW5ansW/DnU8JkNJ8KsR26EFe99vI7R6wj+Cs8z+6z+7VD
         hOIDN8WtKoog3v8f2hassUm1VxU/YVuvHaOpY4Sm+p99q0LryaILJYctRtJ+sXay/Rcc
         9r9BO/8rNo7F+L57SVO2BbsllE0nVphZ7mbBp8fhmkrpw2oOvQ7nWBUOJpT0impw/3h5
         mWyA==
X-Forwarded-Encrypted: i=1; AL+hErHWirHWXSR9BbG6+6ExoqdEkKpqXZ1nfXHZ2lpu8M5YHkxgWp5OwrlrtdIY+GmbjwLbJkQqyMgseIyK6F3sGg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9GPFo4kmTDdqLOgmbkK63oLIemoxsuAH5w1nm3XZLCYIDzZrOx
	tVsGIQtp44XOg/kH6+eL3Sz+50OS3eDlmg1QNJDlL5I2OxrMlkHVgd61
X-Gm-Gg: AYBFou24mf11+YXUJeLNkA6WtCFmYC7kIQGOCAzOILKZuwGjS9kfNjkTyh4XgDeNXyT
	CbQR6/vp36o86M+fLprObRscH1GGx/XKKEjakXp1e2t/PHeQrnmFVLS6Y5xbHykTBM4Y7cP5Tc/
	IqSTLMSLQqLBccuWeyqa6Vb6FwjT2kcEkc/rMoXFS4fp7FX2RP7L3o910Axb8+AzstEcABaINEX
	lSRRYdMRLJnn+LBLxGWtJQnVZ8yGqJvjIkVkwaL1QfJR+OBZLJnaky7hOn8PXPDU75ZJ3zPdfZ7
	vYGTGg85D5NiUnAe8AjfK+X+9eO+JYCohSdC1JCQUm2IGV5caBil/pARU0BhVMv5AGp3+qOQvLa
	SOHGJVAXtz1r0vy8sCwaqM0KGUyqw8/e4rzgjlzAJ6hUjBo3m4jy2fly3w3oLj9qqmdCtjlkeOk
	PWtFQ8cQfAapr6MB4kjXSzlpPFMnlkuZfOkQx6tVXb8BjNmVdZlWuDBrosU3DlHGlKzllvkKp/A
	P0iydUhhxI7Yi8oEYinkVxJxjUsm0Juu8Rb/l2IIvyPqPMnKSpWpvi7myivHt2m6Kbjjv8U4J5O
	hfOKuMrtdy6vvIiXlkd8MGVv2hrPvWvK89g=
X-Received: by 2002:a05:6000:1a8f:b0:491:3fdd:af37 with SMTP id ffacd0b85a97d-49c71d490famr20261299f8f.28.1794813616825;
        Sun, 15 Nov 2026 23:20:16 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm22953761f8f.1.2026.11.15.23.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:20:16 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v2 0/3] wifi: rtw88: three fixes around the firmware recovery
Date: Mon, 16 Nov 2026 08:20:11 +0100
Message-ID: <20261116072014.1142494-1-mehmet.fide@gmail.com>
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

Three fixes for what a firmware crash test showed on an RTL8822CE.
They do not depend on the channel switch series, but patch 1 and
patch 2 of that series (v11) both change rtw_fw_update_beacon_work():
the one applied second needs both conditions in its test, and I will
rebase it when asked.

Tested on rtw-next on an i.MX8MP board with PROVE_LOCKING,
DEBUG_ATOMIC_SLEEP and kmemleak, with hostapd. The
firmware crashes were triggered from debugfs on the RTL8822CE:

- patch 1: three crashes with an associated station interface lost
  five reserved pages before and none after; six crashes with an AP
  interface lost three before and none after. A test build that queues
  the beacon update work between the reset and the reconfiguration
  warned "Should not have an empty reserved page" with v1 and did not
  with v2
- patch 2: an unbind after the crashes warned "Have pending ack
  frames!" before and did not after. With a test build that drops
  every TX report of the firmware, the unbind of the RTL8822CE warned
  before; after, neither it nor the RTL8822BU did
- patch 3: each of three crashes with an associated station gave the
  "sleeping function called from invalid context" report before and
  none did after; the link was back after every crash

With the three patches, AP, association, power save, firmware crash
and scan tests on the RTL8822CE, RTL8822CU, RTL8822BU and RTL8821CU
(two adapters) on both bands gave no kernel report and no kmemleak
report, also after the rebase.

v2:
- patch 1: the beacon update work does nothing while
  RTW_FLAG_RESTARTING is set (Luka Gejak)
- patches 2 and 3: Reviewed-by Luka Gejak, no change
- rebased on rtw-next

v1: https://lore.kernel.org/linux-wireless/20261111213239.569224-1-mehmet.fide@gmail.com/

Mehmet Fide (3):
  wifi: rtw88: free the reserved pages of an interface on firmware
    recovery
  wifi: rtw88: report the frames purged from the TX report queue
  wifi: rtw88: reset the stations outside of RCU on firmware recovery

 drivers/net/wireless/realtek/rtw88/fw.c   |  6 ++++--
 drivers/net/wireless/realtek/rtw88/main.c |  8 +++-----
 drivers/net/wireless/realtek/rtw88/tx.c   | 20 ++++++++++++++++----
 drivers/net/wireless/realtek/rtw88/tx.h   |  1 +
 4 files changed, 24 insertions(+), 11 deletions(-)


base-commit: 61a5eb87b2d9b4d5e353780b781cf691f39ba9e1
-- 
2.56.0

