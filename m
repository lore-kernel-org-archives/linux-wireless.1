Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297717;
	b=1Ia5q6RNPqIEm0B/vTnlveR7NV9TcJql6JBGgbroRlfN8S4pXtsCubFHuLWSlOLJR2ll
	 y4vpenJA/GbVLCQAbOxbkkwujhvQW9jey+D/RMzzNyBI2mtttpxsTVawqIXd82kNt3rDJ
	 YZKLXzXS4+3C2lgVYFRi9wjZ/NmkoTVyZEMTFW7orchGMsqc5eU5jSKt6ZnA8h7lpC60h
	 lpz3bTxaBlS0BniMA0uE7J/lfJ0O4D2yNmemdNuHL8uD7oocAPWqGNzqMRY1uIs/taUv0
	 9uFZQnGxJ1A2wo4yUEKXvvuFYd9j7i/RiKY7fsVzG7POxiUTrFFaCkM5Z7vQPzE8MxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EPUo6tPxy3+xXI79857cwMBT7yh36CtYaQLl8v+WbIc=;
	b=0szbQnxnw66y8QLkBIOAz4jAq9S4Gjr78lpxVBIv6zjKm9PwD5gv/kAHv5r8xJM/Mn/J
	 rNw3hcVtqbk0X0zYj4dr8KXzs5Ddx9Es5TPkcL5/fUEn1sCS4jMD3G88m4SBd6NucR3Az
	 FBvHAwYY/54gb2t6TWFHoUtx6C3eDv9kmVFXpnlnWv+hHiNRlNIcZ3/DXDVeIIkdOH15w
	 BWaK9zjyn1ODquPQZJwHJzPhzTCSJUEUepnLUpztYnNS8SZxY6ANkYONFN/Xw+4Y+Kp0V
	 Y6PXy91UOVCdEqI7LK+AVMIltc/+jQ/ao3vUWsPA8NN6y/xejM3G938g/UyrSqbTbqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xG/ojqDV";
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4663606A325
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 08:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4663606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xG/ojqDV
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b0b3754f57so1027733a91.0
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 00:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794297716; x=1794902516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EPUo6tPxy3+xXI79857cwMBT7yh36CtYaQLl8v+WbIc=;
        b=xG/ojqDVb4pMLachpWjicT9wmmsTsAgsWvQSFfgSu60CIcCw9lX2IjgroiuUFveySQ
         Po6p/IgoXBzH4QcUtTF2sZLJtqBqG83M3rnQqMPkSqH8ywA11QHT+lb3n/FVBWpu8Iz/
         jV/enwF4FEkqnkoAHM67ou3jaTUvLXg5KV3umPLBu+S/s0qtCB7BE2Y+5xmVpjZEFXg4
         AW+40MTdZRK1bUQKa79xL1I5EL1hXXyxTRUWpLmy5vn9WrcTHHQzatSMZ9cmeNEWYFPm
         KtxdJ3rCqTYc1tMmIXVV0yl2xQhf9p4lebloUbDr+0AKRrBt9i0MLr1TxmAS+7n6FABU
         D2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297716; x=1794902516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EPUo6tPxy3+xXI79857cwMBT7yh36CtYaQLl8v+WbIc=;
        b=YaEA+GD/kUkmgk2vjRTCMVzBJQGpWi2YDbFG7U1DuLm6LHLUXYaAbv/lVARSjgSCGp
         hK0ptol0HCUXUdfv+G9bgy2hI489Nc+bhSv/zRLkBY0BaaW3vwBV78nB11IE2HN5n8Bw
         8yjmbt59oVwo4SpsfQRIGntXyEl/EzMj9Pny2peTcqYNPecKD/ISfPMU51Mosl7h3YKT
         eMJzP+JbL718dG9aTFalyuZlifEl/Stun088lrwg68dEp6ODSbLM15suh3peXMxmPE/6
         wA9Gy7pOv2kXVxapCv/ZGJMfmLFgQaWPz8WRS182POqiHw9RQ0MXRkV0uTR8uL8iZ3XU
         CD3w==
X-Forwarded-Encrypted: i=1; AL+hErHI38sxX2X8pvocOkE/P2qX3SD/Hv/TqVF23qRumTYbuBot/WJzoB+J0taZRz204sJN2MNJZ7+1avZLoslVrA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8H/bVUhm3iqvI/K9npdQ9qP3EXQJUL/NfLT3K01WrReFPKudlC
	nFe39kkMHw9SNxkH7Eh5IaBVV5H4Waz0FKaf6dY63nLkMiMUyLkKxDFt
X-Gm-Gg: AYBFou2sa+DTQPfURvOjLM9o1NpUzdT1I1W9FxuQnQFg6WvFfygm9wkX4c4pkp/uS9T
	JEYVr974+TtoiT0PY5XmnBH0rvxBqFIAivlHYXdlZ+IsKTHQ+qAUvFNO2seCSqfCV6rPSTRUpP7
	3zNTvLyRqN5qflwYE2K1QMsla31Umvx+LOTXF0TCjSgKwtmez9opOqWh9qZfsZZGGajB6hOwCAT
	IJJY/1TVOpmINDcxyS2ozvdf6151fRrXX8YoIndKBvZ2uXUmBhdNkN1dSTCoNixBWOUkn0HXs1+
	WbE2/sLJ3v18Tz2sMQ1mBNzmvIiw9Px54t3W7PabaNrmJ77XSjqBVPLpNgSEvAC3tf9nvGpt/6j
	YvQIoMb8yDJAEd4xd8xTZVKqz3hbGPGf16a1mWtkLoH7ju/9+kR8RXtW1zXLfnZKgz6Y8Row8Da
	+HvFJAN/r/kq7gVeMBh/3KN+nRx0JwJ4wUUyL36DfJXcj7GC8idCRmW9bMvjb3BouF9EWUyDEuQ
	coxXpMT+rP5zWXX6dWCz5qOMyfdSoo0CihRyjApxS+OEmNXv+okPKchqZmgB3goLAZvUXE8Pl/J
	wN38yxNk1ibCOWi5nZzW8xno0BJbkq5jqOvXD/aop/JCyCOWKetVXRp/qLh6fdap5idnvI6Y1+0
	H5AP2AwW4
X-Received: by 2002:a17:90b:448f:b0:3ab:c370:3684 with SMTP id 98e67ed59e1d1-3b166cdd917mr2067182a91.30.1794297716077;
        Tue, 10 Nov 2026 00:01:56 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:b87c:eff1:b55f:23de])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678ceda0sm2906627a91.5.2026.11.10.00.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:01:55 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: [PATCH rtw-next v2 0/5] wifi: rtlwifi: rtl8192du fixes and additional support
Date: Tue, 10 Nov 2026 16:01:36 +0800
Message-ID: <20261110080143.1362021-1-hjf3108@gmail.com>
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

Changes in v2:
- Drop "let the firmware use all rates"
- Drop the test results from the bug fixes
- Add a commit to move the extra headroom define
  into a common header
- Describe how the frames are split in the RX agg commit
- Add Acked-by to the commits

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


base-commit: 04c9984187228904f222681661c50db3f0c50b71
-- 
2.53.0

