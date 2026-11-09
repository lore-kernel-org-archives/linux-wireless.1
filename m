Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794264849;
	b=JPRrnBIC/DR6O6fddulbVaVCmZBI9MpnXozb4YPuDATrtE5R7DmbeyLDdtISpGI0v4e9
	 71BsDXbr7b5OgUJsGZ3B+IS5/3tKrMjcdzJrZBtUTwdQ6CVZjEG2H0n0e454XBipLRNGo
	 Z8jiKOuHuGXc1BVzsQCbtBfdBXadpzv87nx0+sEp0EeorhvAo3M0FONLZIEeShP0OAkwN
	 lgmUauCwOa0DoJJ4fD08PD3A9D7mkDwKi1lIVFvKJOdEpw1jDGit1cTfG6OefGdizBAhX
	 TaQV766cQH++NHQAHB4d5wXXG/gl/eG3IwZlUwtCcpM9mD5PEozrA1By1vLQIu55aaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794264849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8YKt/mxN51KEu82BTf2/x4XlarXoVG+PCXLXKuY4w3c=;
	b=il8N1aTkKqttGUtVFfpKRM+UBrV8aQ85/blJiXtybj0p/Sy1g4NW42XGOY8IbmaycUEZ
	 SH0yk4/wHu98MtXLkXvVMCZsImhw5ddXloRgpIQxWNFSk1tjMspk308VWSyrr1l885u2S
	 WrLgS9/z07a3BFnYmqq9i9jneoYOFt7gB48bXb5JqLIaFthRTaDyqd76rFr4sKeLZwySi
	 jb4nMWV/fMLoYW77cBmFjzfLQTALkH9hTqaMqflCKSUowa/2lk7pkTn1pkkewgGXhyV5b
	 FaJR0n05BZCW639srKgOhMXz1fmxrodiXchsGXRCwTN3fAt42YeKGyvl9sLAtIxomEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CcOFuXJx;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2285B606A31C
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 22:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2285B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CcOFuXJx
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso13649445e9.1
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 14:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794264847; x=1794869647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8YKt/mxN51KEu82BTf2/x4XlarXoVG+PCXLXKuY4w3c=;
        b=CcOFuXJx5aWpqmcP1OCTOmOPX1dH9kwI9qwT1vsdHetkX4VMcj1hSt+/09citz1YEi
         MfSdm6U6mAc+rdb33fuNchc92cZS+Vz8qysZbECRkBzEz90aYnG+LtUFIAQMeC60hu33
         WexhsB58DqaWzOAE3Ub+7iiAuEP9GvlQgZEZ7C+Tn/l/tZQ+0/+D/Y2FHNPGQszbSJfU
         ft86gHKEQLC4O/+puc+2Jcdu7j2pOywH8sLdMuYDtmqb4Q+qbkoyQ7JlSoKqnZ1m/e/J
         dIcZZTF9EazdI32KKC/Xvrpes2LSpbRCj+MzJVgEcltBbsvcfi5cKHsLZdDheF/H8hWb
         k7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794264847; x=1794869647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8YKt/mxN51KEu82BTf2/x4XlarXoVG+PCXLXKuY4w3c=;
        b=vVcxVQU0h/mYlsAPFwr9Npb5LrFGnHkygRpABVT/aeKnSgVsH1T2mwGMz2J6sP60Um
         Sz6ABDbn0cykTXSkw4E+MXav9OEI6RsRTPyzQci0Os4sM4t1/pU+jYIHH9Bx2G4EWvab
         zDMOmR9/qEJbVO5Wh/fZVRoxOzorW0PuJ7693poz/nQwFytI5hTheoc2rwIQj8UtjRKo
         7+pTfttN1siQtf4D0A5jwjV1/3bGTFmRK/c7nBgT7nK0YoLZ6h7FPaoZpYDnalND3thd
         R41rbtZmISGRG2O78j+2pSYBHf3F8u3AtAnA7HUX/ZmwlGZFgoEAzYasceEMyEjFkhvB
         Fi8Q==
X-Forwarded-Encrypted: i=1; AL+hErF/IdbYfEDfYBXgF0oN5Q7lZub0noatiIJCbbu1eu7bIUBRfyIAm+/vDd1k3LcSq+oKMQrGlB9zEuW4jb9npw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8u2A94mQAKdaA3PYP1Moj2MrNT7EPp+0RfPvZQcS1nqSXq34Ak
	LpIxq7AKWO0cPB4UVwOEqUWziRmKFYDm5b8A/4ndRoOyGSO6VonFxpj+
X-Gm-Gg: AYBFou0NL3R7+hLRvN+vq1Fz75CE6tXpS7MFVUKE24G8Dw0f87OWUClyiNKn8N3N70v
	om24dSmpU7TxSwQ7vNs638ZrdSA/jSsBe+Yb704PNpXpSXDJd+uo4/SkZ6t0TGySCFishJTM84M
	kp4qa8IrIK7sZy7ODJGWmNdDtcA2y/Ud81xyXsQegCFIPx4qeTYq6XykB5aDETXBV6L5asph4/O
	4a4m1y+xRq/fgBp5TdVDS8ihaKBzyjo7bKACzxnBl9Qp/dPDbxdLED3qIjk3IlGTFaWSgH3ZaeK
	FWQEeo+ZNqV9tQ/6aBYxtCI+Aq7BdW3xUYRShqddRY0uUCsbPbgKUd6/lxzu9PAx0cLIHR28nGz
	SDFWkw89uVdQDjLNEsxr58ZvHGCJzF6pe1XvSXAb7QPSvMJ1Q0ZDFLPZjFeo/FaHaVEfqBa53Zz
	2pP8iNUJH8gFd/0q7TgGwHYqcaTMwzxXiPz67pk0lt9oN6UkfWJ8NpHmmZadQZhn/8/TSvv1WUC
	fQwYdBbBVaBCFijhmz1wIekpUsZxjvgAi2LN58exCp0aLLyGxl9LQD9OrLExEH2SOY7MAflcgti
	xwFs2iGkZuTKvI82VOfabbNZbxGbJb5Kr7eQgMmCYGaWOglxTY6BhXu0o7/jPllDfQAZZ0YGRqa
	1+yZoOLmv3oW6GGKuKr2zNDmFgGqZq3iKHem13DocwQplJYof9MHYl7MDSUOoGuGMwdIhn+3h6W
	aPMjKybPYie9H+3zcJpWALXhY=
X-Received: by 2002:a05:600c:b90:b0:4a3:5991:719 with SMTP id 5b1f17b1804b1-4ba02350f77mr10169475e9.31.1794264847422;
        Mon, 09 Nov 2026 14:54:07 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (141-136-138-190.dsl.iskon.hr. [141.136.138.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204342asm21435365e9.6.2026.11.09.14.54.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 14:54:06 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 0/2] wifi: ath12k: PPDU stats user count fixes
Date: Mon,  9 Nov 2026 23:53:53 +0100
Message-ID: <20261109225355.23161-1-gsustek@gmail.com>
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

ath12k_htt_pull_ppdu_stats() rejects PPDU stats messages whose common
TLV reports num_users == HTT_PPDU_STATS_MAX_USERS, although that value
is in bounds for the loop the check protects. QCN9274 firmware
WLAN.WBE.1.6-01243 sends it in BE MU BSRP trigger messages addressed to
two Wi-Fi 7 clients, which makes the warning fire on every such trigger
and fill the log on a two-client AP.

Patch 1 corrects the bound and keeps the warning for larger values.
Patch 2 fixes a related off-by-one: the per-user slot finder and the
per-user statistics update skip the last user_stats[] slot.

What the data shows (diagnostic build on an AP MLD, 5 and 6 GHz, two
Wi-Fi 7 clients, 2026-11-02 to 2026-11-09):

- Every message with num_users 7 or 8 was frame type 25
  (HTT_STATS_FTYPE_SGEN_BE_MU_BSRP) and carried user TLVs for exactly
  two stations, with up to four user records per station. num_users
  equals the number of user records, not the number of stations.

- The same firmware advertises max_user_per_ppdu_ofdma of 8 in
  WMI_SERVICE_READY_EXT2, so 8 is the largest value it produces.

- Rejecting a message has no functional effect beyond the warning: the
  user TLVs are already stored when the check runs, and the per-peer
  statistics are applied when the entry leaves the list.

Changes in v2:
- Keep ath12k_warn() (Jeff Johnson); only the bound and the text change.
- Add patch 2 for the slot finder and update loop.
- Base on current ath-next.

v1: https://lore.kernel.org/r/20261101203718.60679-1-gsustek@gmail.com

Goran Sustek (2):
  wifi: ath12k: accept num_users equal to HTT_PPDU_STATS_MAX_USERS
  wifi: ath12k: use all HTT_PPDU_STATS_MAX_USERS slots for PPDU users

 drivers/net/wireless/ath/ath12k/dp_htt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)


base-commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d
-- 
2.56.0

