Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174291;
	b=1v67wlgMldm/xn62gv1dBCm0WyrFzrfcvbd4IvSa8HnVPbX7gIXeuc5qUWWghKatp1ec
	 Jk/fJg4Xh+onyuK5bps0HRdlrYp5oZ7rv1MaNv2fOAcgrDF9SPxZ/jeaTxkdAjSKVdwCz
	 aWFJW3Mu6llZdfzikmwL7KKG0NjPls8E4wT7/OyLYP1Dowe7BoM7g6v6BcK2J/BG4aUcS
	 qh/4KEzhVl577Y2mtwR2TJXgxThB8QZ8yhhTp7fhl/hlQn7cGSg6PUa/uOsMqYdz8puMl
	 cMHKRQvwTcoOrcPbdCKAxORBY1eUTSccdfPmnOsOsfKS9z+WhV2pxcycROHCIggBScA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=61pgidgMOlKV3QTNf/1zYqiDzNU8aZjvjx2edtSfpjg=;
	b=pTdouD5N0zN1eSDODDBPozJykmkv+RK9g6Wsod8FK/hbe9J/jDCG+wKPsjEncZIIL6W/
	 2li/miVVfzlcOTM+RpSsurR2qmNqxFFggdFn/Ef7dnO1o6SreYskilMIc003AnoOnmxkQ
	 LJudxwJCyhP393sLdrvnvUZD4AfwtPH2coLPYiEXOzh/hhen5gFbNmU7tQy1lNdmHPuGN
	 6BMGxVLXwG9kM+xLVhRu4ch+CtHAdhqsGyTKt8GBNS6C1vAF6TxlunCe3w90odoz5aVwn
	 ROxmwuRd8y6zhL5MKUequvXiePdLvH/RfeLdWQOY6qS/1HNSfeM845vr/29XGfG85EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KP4UWxih;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA2F60A2600
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 11:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CA2F60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KP4UWxih
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3712b6d9843so684743eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 03:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795174290; x=1795779090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=61pgidgMOlKV3QTNf/1zYqiDzNU8aZjvjx2edtSfpjg=;
        b=KP4UWxihzvVM55PTAofrXE3wN+/3/sPq1+KjLO10W2v18mRXZ3l3BZiHykmTLY6PIq
         leQbBl6etURW4z46/2aygqSCMj58/13nLBGzZQxrsNpM1og+ZuF+ynohumLbKU6DlpV0
         4KQm7W3/sXBDFX4eXHQ+xk1i9qsVoCzpReafODlIm8wnY1xuK3wQVbi7rUc9+0vspcKW
         gVvg0+axDFdrtqRhxGPHbSg7jcbBmxoAb5l6g55tJ9QSBpJyhSpRPh/wERSv6Qw17rTS
         j/MK8XtVrfOusARxMThZP7NTDqYw0hOZh/EWZeh47TWoZUSuG4l2HaYp7x2XtLAhergf
         ZY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174290; x=1795779090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=61pgidgMOlKV3QTNf/1zYqiDzNU8aZjvjx2edtSfpjg=;
        b=dcaXnihYERL5wz6qKJSsSmVLFUnOHg/D32APBEwhgrM2keay6lGxlM3D/6IhCtPOuh
         uO+92LYhA3osPeXqMVAzM4P+HmSqOcIxw5T6MUEiAnFIzI0nIvQUJK6mjismf1/452mn
         mFVqjy1wdO4T4vQfmd9R+1OQUdIR+Bb1fWVQ1XIzWNWrFW3FF3nhHjEJSrSu8H8onmuO
         jpd63bZrQuezAlhkOsbzk/SQwrlllMQ5ezYZgR+WNfHYks1bGBdzmdcmLoo7SWFIOr1G
         pRx96DAW7zgmOqLK4o51eCuHaDE8151STKsOX8y/hhEhKmbvJ8UszgOBB/vY9aOX9nSs
         OcjA==
X-Forwarded-Encrypted: i=1; AL+hErEJ9Kq/q8/EFj3yeZR/Uc02Zc2nmsXyKKMmOP5ChB/IytoOYbpqoL/NoAQK6K1w6Xjbq8KHAIz1tdFaTiy2Ww==@vger.kernel.org
X-Gm-Message-State: APuU4Z8+SwOJGmhIhFZJHt9wanTBI8mQX7MJwuFgpcu9Bsoqdn6j6kc8
	iJLwx7bPFIb84Q4YqpARKIEZb6xCM2AypfRB8IRiqWfkTtKOLKTGyUeahE1xszK543I=
X-Gm-Gg: AZFdTZcCQ+j7I9YGBY8L5mw5vSZ0zvtdlXG/Fnuh9cl8EMncbkc5z30ertKLPk9wsWt
	k2JWpZnr24UQ1OqzM+Mx4kyjO8p+jqRrl3N9N34xKfyZmK4K+AtwRk3BKoD+JmJ41lgdav6Dp9d
	IP8FadK++VDJVD6r7s7t+Sqb4Aw4ND+Y1eGqBCxPnGbAkYHvzgNCenYij8zTlpopIsZX/3jCNjs
	C0fttoE+6IaApda3CIfw9JB+611f2vJSvmv6Qu6jReBsHNKmShdV/gMMJJPr+ohtCAJ92FCzRcW
	j/PJq0MWNlROSQMCausCjUSEAJn7f2NiTEll6hIB20mL6W3XXJSdPubmn23o5clQINtTgoE2oKP
	L7l9f32lnK2vDptWHKoAcbwp5UIy//g7Hgy170482Q+nQZ/aiNK76Col5M71WKKpG9DZGI50pYe
	73E9oXdU8BQy9UR/8rXVj302Fyki90FltRp1DHR1lnRW25pWhiIqldA6dYwf1b2oOPA6Ca4KZ0h
	+iqUky1n0XeJR2+jZc0bLhlyJllSeVq1vASHPfzlNUnVvCeoUqJciHk/KK7P/O+LgnHXuUYWVVP
	W/Mh05p0OwbRbiqiRJB9i00iiq4VkoHqvlNtAmEGK/b9VwGzIVR+dELQSLPlOxD6bshBwG5EubH
	hA7+D0d3LlBytzqdQGzaqSpbghd0jMPTR4uDUioqPDJ+ETuxLzJFp5VBGS3Xp8aC7fg==
X-Received: by 2002:a05:7301:85cb:b0:381:edba:caba with SMTP id 5a478bee46e88-3856fd5cceamr2623199eec.17.1795174290231;
        Fri, 20 Nov 2026 03:31:30 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:fe98:6351:c2cf:22c3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm7134347eec.16.2026.11.20.03.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:31:29 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: [PATCH rtw-next v3 0/5] wifi: rtlwifi: rtl8192du fixes and additional support
Date: Fri, 20 Nov 2026 19:31:09 +0800
Message-ID: <20261120113116.153232-1-hjf3108@gmail.com>
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

Fixes
- BA sessions started for QoS null frames
- signal of A-MPDU frames without PHY status

Implements
- USB RX aggregation

Changes in v3:
- QoS null BA: explain the benefit and the impact
- usb.h: align RTL_RADIO_TAP_SIZE_RSV with RTL_RX_DESC_SIZE
- Add Acked-by from Ping-Ke to patches 2 and 4

Changes in v2:
- Drop "let the firmware use all rates"
- Drop the test results from the bug fixes
- Add "usb: move the radiotap headroom size to usb.h", used by RX
  aggregation instead of its own define
- RX aggregation: describe how the frames are split
- Add Acked-by from Ping-Ke to patches 3 and 5

Tested on RTL8192DU 2.4 GHz with iperf3.
Testing on 5 GHz did not show any changes.

   before after
TX 7.0    6.4
RX 28.3   32.0

Ho Jie Feng (5):
  wifi: rtlwifi: rc: start no BA session for QoS null frames
  wifi: rtlwifi: rtl8192d: report no signal for frames without PHY
    status
  wifi: rtlwifi: usb: unify the RX code path
  wifi: rtlwifi: usb: move the radiotap headroom size to usb.h
  wifi: rtlwifi: rtl8192du: enable USB RX aggregation

 drivers/net/wireless/realtek/rtlwifi/rc.c     |  2 +-
 .../wireless/realtek/rtlwifi/rtl8192d/reg.h   |  4 ++
 .../realtek/rtlwifi/rtl8192d/trx_common.c     |  2 +
 .../wireless/realtek/rtlwifi/rtl8192du/hw.c   | 18 +++++-
 .../wireless/realtek/rtlwifi/rtl8192du/sw.c   |  2 +-
 .../wireless/realtek/rtlwifi/rtl8192du/trx.c  | 45 ++++++++++++++
 .../wireless/realtek/rtlwifi/rtl8192du/trx.h  |  4 ++
 drivers/net/wireless/realtek/rtlwifi/usb.c    | 60 ++-----------------
 drivers/net/wireless/realtek/rtlwifi/usb.h    |  1 +
 9 files changed, 80 insertions(+), 58 deletions(-)


base-commit: 0bdc579dbfc251a6b6838ee9459b6771b948c617
-- 
2.53.0

