Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.36.144.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795206426;
	b=qVRzaGJ5SneXo2ArxSsXaXnPU9YNBAk9oiOALBaJ6NAEah6y/8Upv8DMI8igAMSC5vT8
	 aECsv2EKi4bcxo/44CDxO+d7xbCf9+ChcLmcrVHRNp/6KbHGNfikB5j6AFOO4Msx87HxK
	 xmmLWmoIwtuPBe+9agwZQsezVt7FHwjDaMpJi9BLV4THw9wQdI2lWuuxl1jr8rD7i/P4k
	 CEE9XQWd5mR4m418iBUuONc5czQFVpVE+nXpdAOCwfm6civo16D5JchE4vGyQTCCe3AA+
	 gcb8H0SkjXVuA7xGPAlf5rI08AjL/2voMbZpAm4Mc1TQex9K1AYULT62SNIcr5Bto7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795206426;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=3rZ83/i6FjK2ITPkSFGbVXrrnU5HZyyFU+bMfZ2QB8I=;
	b=hwDCZl7pKHYkOQce8bZifQThXf1flDTsfzYCckL7ylX0zT3H6xj5g4tg0N93wRFPMvgb
	 Cix8kjUYhnBRQRe53GKdfwbnIL+pgApMsQFvt/9aW4ns8OorZ0+I3N82HQM58YIPjUXo2
	 5kZEpBk0waOXxbeD/TVN0gfAD/pNUiM4DNdjF0+2sVenY3FUYGfqk+DA4xVpw0u46hXdl
	 gedGYIagDl5P6XJs3GWPi2FW09aOLpHPNBYxAHquRS1Zm176nGGN40YqcUeL+QQlKZhub
	 eNjqw3kf+NjtFGhs0Y0crJBiZh4CyQAnvsuGYTpQkrCztgcu/kbVQn5F/UstkCm0vIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yoxcu.de;
	spf=pass smtp.mailfrom=yoxcu.de;
	dkim=pass header.d=yoxcu.de header.i=@yoxcu.de header.a=rsa-sha256 header.s=dkim header.b=EJFjrrGa;
	arc=none smtp.remote-ip=194.36.144.171
Received: from morty.yoxcu.de (morty.yoxcu.de [194.36.144.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B74C606A6EF;
	Fri, 20 Nov 2026 20:27:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B74C606A6EF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=yoxcu.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yoxcu.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoxcu.de header.i=@yoxcu.de header.a=rsa-sha256 header.s=dkim header.b=EJFjrrGa
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 99D0F1D8717E;
	Fri, 20 Nov 2026 21:27:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoxcu.de; s=dkim;
	t=1795206422; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=3rZ83/i6FjK2ITPkSFGbVXrrnU5HZyyFU+bMfZ2QB8I=;
	b=EJFjrrGaAuvUmGu5wIKYr0pMmvLdPk5YDxksFdTQ6XkKp/MgfXWWH6CJA7eH5sjKxCckz5
	gD2Qw8KYhZSkXsJ8lOpKeEyVSuXm5At0atW8ldCvv9F6Ry1ux+i3ANsNI8/NNrJGeJAVFK
	W9z7jIuwGLnQd3xwx2u72KQAJyVHmplwJ/TFyAIb6y2replAwA+yXvl4RvQj0+aGzuCF8n
	nSe79ZqIgTm/RMUDGVbZc50m36p88HyV+NN6jfZNOGhh6mO22VRtZxVYg0L65rUwdkeMeM
	IPe90c0+lPXx/UQtwL0XMjqEanSNi/XaacYSaoEjSSeP6GIBxjDV94IUW/cRTQ==
From: Michael Auer <mick@yoxcu.de>
To: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Auer <mick@yoxcu.de>
Subject: [PATCH 0/2] wifi: ath10k: Fix WoW wakeups on WCN3990
Date: Fri, 20 Nov 2026 21:26:50 +0100
Message-ID: <20261120202652.344435-1-mick@yoxcu.de>
X-Mailer: git-send-email 2.55.0
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
X-Last-TLS-Session-Version: TLSv1.3

With WoWLAN enabled, WCN3990 firmware wakes the host on action frames
right after every WoW entry, so the system hardly stays suspended. And
when the firmware does wake the host for a real reason, user space
cannot see that it was a network wakeup.

Patch 1 sets the action frame wakeup filter that Qualcomm's own host
drivers set. Patch 2 reports WoW wakeups to the PM core.

Both are in daily use on a OnePlus 6 (sdm845) since late September,
with an sdm845-mainline 7.1-rc1 based kernel. On ath-next they were
only build tested (W=1). I could not test QCA6174 or QCA9377.
qcacld-2.0, the vendor driver for QCA6174, sends the same command, so
I expect their firmware to know it.

Tool use: the analysis, the code and the commit messages were
written with an LLM coding assistant (Claude Code). I reviewed all
of it and tested it on my phone as described above.

Michael Auer (2):
  wifi: ath10k: configure the WoW action frame wakeup filter
  wifi: ath10k: report WoW wakeups to the PM core

 drivers/net/wireless/ath/ath10k/wmi-ops.h | 19 +++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 47 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.h | 32 +++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.c     |  8 +++-
 drivers/net/wireless/ath/ath10k/wmi.h     | 23 +++++++++++
 drivers/net/wireless/ath/ath10k/wow.c     | 10 +++++
 6 files changed, 137 insertions(+), 2 deletions(-)


base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
-- 
2.43.0

