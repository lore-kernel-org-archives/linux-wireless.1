Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795283644;
	b=Pf1QcFXFTK/sDNEaNbY5i+JNDyfjD1vOwMc2KJBUw12d2wi8dXOujWR2vb2AiyrSWnY0
	 ddvUSjFOAbNPHpPrcBo+W8N6zDjul+EPz2pqrDEXNbqbctz4y/weccGTWAi22n4pPmKOy
	 m3k1fwZc3eztE3GS0wyzeLxdfBEfBvY3UnmDTliFshOvsBSJb+GE0nB2yCr88S9G9bG5A
	 +GQkJ5A2qzjGwS2vwjeBhiR7OH1r7NPmqqHz1TXhLyHLkoda3yIkh2mSLl4Po7b/0gjG+
	 L6PTOKutg6AiXUQgShqrTDypNyUF4R9AwDWudN3CK2Nw1FGH+4VSbUhDzY8lc1GmiHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795283644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wjDHCOnpzBN9eKZwwUbpNTzSGVofhKbk9Tp6cgxSwKk=;
	b=G9QMuUBaEujNhdJ+hADscvQsTrvxO8k3yxa/nuznunrqDSR+l7QV0HntxgMpUf2qjN3G
	 /TEOyfn/i7Z1/1Cti7sFU+zInhOFUVZu86O9MoS+eXhdYex8m92SfnmcW2B13QKly1d8J
	 Q7L5tYgWEFH7xiuW3bf2F+qufwsIWHSvEcloGfjygJGcv45W1TPNvlT65HmOflVqOXmht
	 inB/5dao+Sk358izZj8ahvF9cfccR+cSY/WsXQgEjy1KwEQTCHbb+lcCGQiUmzpRm8caA
	 dI9evoy4EZI+rxFXrccLV43EE/eb01XUVqBNAfzTyAV8miWMm6yJCvydqZs9XC9zwkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=difM9R6W;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2B5606A320
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 17:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B2B5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=difM9R6W
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c50e26763a4so363308366b.1
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 09:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795283643; x=1795888443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wjDHCOnpzBN9eKZwwUbpNTzSGVofhKbk9Tp6cgxSwKk=;
        b=difM9R6WtjkaXqPokPHEiFfoqPVwzPzDzeUcXK4igqkM/VPZGlVVGUyYPF5HbbLhEk
         fj+R+Lj32nRSFmX83jEuGltmTBy1sCZ9moNDAjAsvjyjd3Zbn7W0eltOrQ82hH11cfeg
         KdC1YrTJEjoKPj+hiQ5YNSnIAMETpGRvFu0hsjRsI+89KAwgRB38zwlj8PaPPxQcdn1n
         ACu2ATkDwXWuidsLv/jGSVaYWBP7zLshD/Qsdjxyh554h3k3CUIDj+UWvv+8MKnOY92d
         kQjCv/Tp+6ANuquz09OG7ocT7eSyNda6kLuhprwWm5KOx4w1Uw9zc7qnhH/9eXEMFLPM
         9CEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795283643; x=1795888443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wjDHCOnpzBN9eKZwwUbpNTzSGVofhKbk9Tp6cgxSwKk=;
        b=mDC01Krb+wPwuBdiZMvlxmBATD49aEiFFY7FU988N0XWMmZ7lmpNvrOtLsyfCzf+iG
         DmF8RA61KJlgUUjXRwParrBSo/Dmroxr+ZVAgu7JIgYWAKOHQPuXSqW31soMQ1YExQpD
         rcUhztyBHy0+h0843CIX5OsOgqv7RatHnnM47ONQAV/yDJxbK0GZfqlO/+E9TORc1ytq
         /MW+BbUayX5ZxBCCfZC4K5ogu1e2TLa4WqXYLbmzrhaAO7Itnxsg+1E34ktEjTyQRy1E
         MF8YeXdgoDWGZP8drld7Y+dKu6UmtAzI54fnMtwrqQgZpCcszoSjdvomQn8AB3hb2PWf
         VuOg==
X-Forwarded-Encrypted: i=1; AL+hErGuKTN9IGns04vKnbDvvzrZQpVamtw2aedYWnhTE/tpGPknwGv8+TjqiV60c47smwD1e7ZQZw/+Wka1+kP5Rg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+mzYJCZe1sDJacbcV6GcpbatOOLb+U02RqTxhWdR3sXmYC/HBA
	DNASMtmlha/Usqo80XbsME4ZnyjU5DIepM0Udeuy/666rKBOVGO1gSZoqmhBGxycuQ==
X-Gm-Gg: AZFdTZe01nvyDlv4aJWB1jVmiucAE3ZpPHd+7bea0eSc4jZvO9D0HiQ9NfIrhkmJ8YY
	nJnwqV914PhgpOFaqjJNloilYZXKs/hvo9SquFnJmPlUtkpYKuSdV7U1x/fzPWGJ6G2PrODVKHM
	OmX3WBFUVcBkZqePFOv4L5uLujfGy7GzJwGwUPw3XBJYbJFRhqlZ7Xlvi5oW7j/6C7ROjAWrzjQ
	kNeeostwx4aMg2RkIjUIhOmIgdseZBkUEmJXDJERo8YHzuwgQSaT9z9SjYoTNTBSRDbE+UaD7Lq
	t1ajwvrL35OvQFdamd63f39Qx15u1Ny5QDxLtP5N7kVBYWPXay7POFhIW0WRypSgROn/s9PL38I
	SonZKWag2lnnuqQv3kXZoXOWEieDBrxAzu/LSsMEbMKBP5SpsNa4GRPj2WE0ndXjklldzBwMPGU
	Nc4E08EsAy8Og0x1rWT5ngsiuTpEcg+toyW/L/XtC/hr1gwYNaWa0Nopvioh3NHP9Zba4dc22f3
	kMKHQMYTGTWC6+zd1qQClozqqtWdLOnIkumWfRh1e5MywOZqwO5unIbFi+uaTIH8Kcm/jjgNM/k
	HA1S3lv9INE1wxrDX4EH0DV5DsafEitvuJTWenbBJy8v9eAhhl0GDCEZmm86VZe2WT7sy5a5XNZ
	Wpe+wkoc2bnyIL8XX6//A7FYbXwL3j3F2dptlRFJBGRXpRMIRqMPJntY2b7GKQUwBFD4/yAXCM+
	M+jVhxHquD1nU/dy0zJ5CfL9gk+p25AA8mUat9hKjvypspfzJuCE5gCN77iHAvCBH7Kh4y04fED
	ROLpVQV/9muv3qmmdN6bjzG4C1ne6vp0agfSbwNzp4EaZbgiSfWe6O1QWSlvQtNCdKaeCvYUNuh
	eonYYd+E8Z9EpfsWKzgDIhl4TEQIWITUbSZ9Bzc9EwO405DZmRpy04nUMIl/cdnHeFWBE5m77ie
	P
X-Received: by 2002:a17:907:1b1a:b0:c50:52b4:eb04 with SMTP id a640c23a62f3a-c513a99a675mr589342866b.16.1795283642275;
        Sat, 21 Nov 2026 09:54:02 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470dfa000000000000000a27.dip0.t-ipconnect.de. [2003:f2:470d:fa00::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea8063sm220167466b.45.2026.11.21.09.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:54:01 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalle Valo <kvalo@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH ath-next v2 0/2] wifi: ath10k: spread the PCI copy engine interrupts over the CPUs
Date: Sat, 21 Nov 2026 18:54:00 +0100
Message-ID: <20261121175402.644803-1-julius@bairaktaris.de>
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

The PCI ath10k devices are capable of multiple MSI, and with all
their vectors the firmware interrupt and each copy engine have one of
their own. ath10k has asked for a single vector since commit
cfe9011a05a8 ("ath10k: remove MSI range support"), so all the copy
engine interrupts and the NAPI they schedule run on one CPU.

That commit dropped per copy engine handlers and tasklets along with
the vector block. 2/2 brings back only the block: every vector keeps
the one handler that schedules the NAPI for all copy engines, so the
copy engine locking and NAPI stay as they are and only the CPU the
interrupts land on changes.

Only the chips used in access points take the block (QCA988X, QCA9887,
QCA99X0, QCA9984, QCA9888). QCA6174, QCA6164 and QCA9377, the Wi-Fi and
Bluetooth combination chips, keep one vector and no affinity hint, as
now.

1/2 fixes the probe error path, which leaves MSI enabled on the device
after a failed probe. 2/2 requests the vector block the copy engine
layout needs, or one vector, and spreads the vectors over the CPUs.

On the AX3600, uploading 83-84 Mbit/s over the QCA9889, the HTT copy
engine's 37326-37927 interrupts in 14 s moved from CPU0 (21-22% busy,
37957-38630 interrupts without the patch) to its vector on CPU2 (21-23%
busy), and downloading 87-88 Mbit/s CPU2 was 8-13% busy against 15-17%
for CPU0 without the patch; the system total stays within the spread of
idle priority spinners, 16-33% of one CPU with and 16-34% without (3
runs each). With the block not granted one vector is used and carries
38285 interrupts in 14 s at 84 Mbit/s, and a firmware crash forced
through debugfs recovers with the vectors on the same CPUs (1 run each).
Without 1/2 an injected probe failure gave a WARNING in
msi_device_data_release() (kernel/irq/msi.c:294), and the router then
stopped answering; with 1/2 there was no WARNING and the rebind used 8
MSI vectors (1 run each).

Changes in v2:
- 1/2 is new: the err_deinit_irq label of ath10k_pci_probe() did not
  release the interrupt mode, so a failed probe left MSI enabled on the
  device.
- 2/2: Jeff Johnson pointed out that mobile clients want their
  interrupts on as few CPUs as possible. Only QCA988X, QCA9887,
  QCA99X0, QCA9984 and QCA9888 take the vector block now; QCA6174,
  QCA6164 and QCA9377 keep one vector and no affinity hint.
- 2/2: Loic Poulain asked to say why cfe9011a05a8 removed the vector
  block and how this differs; the commit message does, and the comment
  above ath10k_pci_interrupt_handler() that still described per copy
  engine handlers is updated.
- 2/2: Sashiko pointed out that the maximum of CE_COUNT_MAX + 1 vectors
  is not a power of two, which multi-MSI cannot encode and some MSI
  controllers do not accept. v2 requests exactly
  roundup_pow_of_two(MSI_ASSIGN_CE_MAX + 1) vectors, and one vector if
  the block is not granted.
- 2/2: Loic Poulain asked why pci_alloc_irq_vectors_affinity() is not
  used. The answer is at
  https://lore.kernel.org/all/20261114210506.787342-1-julius@bairaktaris.de/
  and the commit message now says why PCI_IRQ_AFFINITY is not used.
- Rebased onto ath-next-20261118.

v1:
https://lore.kernel.org/all/20261101164247.258200-1-julius@bairaktaris.de/

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (2):
  wifi: ath10k: release the PCI interrupt mode when probe fails
  wifi: ath10k: spread the PCI copy engine interrupts over the CPUs

 drivers/net/wireless/ath/ath10k/hw.c  |  3 +
 drivers/net/wireless/ath/ath10k/hw.h  |  2 +
 drivers/net/wireless/ath/ath10k/pci.c | 87 ++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath10k/pci.h |  3 +
 4 files changed, 79 insertions(+), 16 deletions(-)


base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
-- 
2.53.0

