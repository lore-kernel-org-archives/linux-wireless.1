Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.75.78.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794647362;
	b=vGOd1rXIVzhLtzwvMRqJ1mZfFJ3vP5dNWoFctswOqQ7as7c5OPpBHf3fWVBN3uEH5QW8
	 5QC/4bpRj5crL7M+MCCibFpSYyR4LlUhqSZq5NQ3gNjecEgftrLxWab9j00ojgmGXIkgn
	 cox3quSR3GbErUdbSbrXcpOjoGoyfNxbVhG8lrGQDdVoLlCtMQDxnb8R1uhhLjQq9b4gh
	 ncOYW/Xa2DofpRJJ3CjcNL9weLL6KpNdpET7zic6aVRVFn0iOFFtiaLcdIFAWMYyv9ZEu
	 GbPXxsfsbp1inYLye3KvfkaahhpuQanPekGccWvwAbQHFhxXv7VrmkpNz5rx/QzGIbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647362;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Fc1AMHFjZdJOsY6HvXjnpsl4FGY8JOTpErhRwf0EaXY=;
	b=W9yaIrQTZIOB8Zm2Btdz1YKMn8yf8PlOio9TkHZdYT5FGHUftD3KflJKy82ctLKvVIiU
	 j+R7JfQoW/y7LitJ/Jwxi2a0tDI/ttlhT70Exg7irTaZCe39hB8LUAly0Fscwo38ruoWM
	 XRoEJ8PK1Z6QLxwbXC6CcoP7FEKU+HgXgpdaiTiOvqUJHSG6znYP6iKn/OYlipZyLC01C
	 sRcOgWvQBIu9MrsRDD64lXHR0BvP7M9qY6QrtOzJDezqOVMNVvHvxOwDMonUNAAjzsfOW
	 nZDpruWGQvQBZdPkVVCYHxZhBEAB4eXv4/EMGZnZDSkbZ5142cRih2VculeeCFXad7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=email.cz;
	spf=pass smtp.mailfrom=email.cz;
	dkim=pass header.d=email.cz header.i=@email.cz header.a=rsa-sha256 header.s=szn1 header.b=S+k7IcPu;
	arc=none smtp.remote-ip=77.75.78.210
Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.78.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FC0606A323
	for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 09:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17FC0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=email.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=email.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=email.cz header.i=@email.cz header.a=rsa-sha256 header.s=szn1 header.b=S+k7IcPu
Received: from email.seznam.cz
	by smtpc-mxd-5f46658f7f-dlhcx
	(smtpc-mxd-5f46658f7f-dlhcx [2a02:598:64:8a00::1000:a36])
	id 739ceef58d685c5f731260ed;
	Sat, 14 Nov 2026 10:08:10 +0100 (CET)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=szn1;
	t=1794647290; bh=Fc1AMHFjZdJOsY6HvXjnpsl4FGY8JOTpErhRwf0EaXY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	b=S+k7IcPuNUB9+a39pQvvkqsBSy85gB1SvnUcLSHqOJz2FUUjvhRqY7ipSvAYpigID
	 9bzGkrGnaqEfhqsooWXoLW3BTOGv4dRwX87PLFS2DSapXp+kxkoOMiO/wmSfLBGrcy
	 ixSjVnL02xnvyZ226MrRReOxtFafn/DQQZDlYMJ+K4sH4WSrkLYQTEYC4BvAyiXikR
	 NeHnbJlbtl9ql1b7JMKjjZang90bLUUuV8qzkS2MflHdd9Sby6Mox4keA/08R+uOLR
	 u1Y+8x74tybR8s4+OHQoS7kSzeVWSPbXE+h1FCWxqPR0V2P/0t7zubB+aEZZOu7qIr
	 yETwjSTgnOCag==
Received: from localhost.localdomain (184-143.ktuo.cz [82.144.143.184])
	by smtpd-relay-5bf55fdf87-n6z6s (szn-email-smtpd/2.0.97) with ESMTPA
	id a5e4434c-3865-4159-b907-7de5041a54e6;
	Sat, 14 Nov 2026 10:08:02 +0100
From: Tomas Paukrt <tomaspaukrt@email.cz>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	Tomas Paukrt <tomaspaukrt@email.cz>
Subject: [PATCH ath-next 0/6] wifi: ath10k: make USB support work for QCA9377
Date: Sat, 14 Nov 2026 10:07:31 +0100
Message-ID: <20261114090737.64348-1-tomaspaukrt@email.cz>
X-Mailer: git-send-email 2.43.0
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

The ath10k USB support has been marked as experimental and incomplete
since it was added. This series makes it work for modules based on the
Atheros QCA9377-7 chipset like 8devices Blue Bean or SparkLAN
WUBQ-159ACN.

The main obstacle is that the firmware of a QCA9377 USB target can be
started only once. It does not accept BMI commands while running, and
the only way back to the boot loader is a cold reset, which makes the
target leave the bus and enumerate again as a new device. Patch 3 keeps
the firmware started during the registration running until the device
is unregistered and resets the target instead of restarting the
firmware in place.

Patches 1 and 2 fix a timeout during the installation of group keys and
WMI command failures during the driver unload. They do not depend on
the rest of the series.

Patches 4 and 5 add the hw_params and the USB device ID for QCA9377-7
and patch 6 removes the experimental status.

Tested on QCA9377 hw1.1 USB with the firmware version 0.0.0.111.

Tomas Paukrt (6):
  wifi: ath10k: usb: fix group key installation
  wifi: ath10k: usb: set soft_unbind
  wifi: ath10k: usb: start the firmware only once
  wifi: ath10k: usb: add hw_params for Atheros QCA9377-7
  wifi: ath10k: usb: add device ID for Atheros QCA9377-7
  wifi: ath10k: usb: remove the experimental status

 drivers/net/wireless/ath/ath10k/Kconfig    |  5 +-
 drivers/net/wireless/ath/ath10k/core.c     | 77 +++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/core.h     |  5 ++
 drivers/net/wireless/ath/ath10k/hw.h       |  1 +
 drivers/net/wireless/ath/ath10k/mac.c      | 12 +++-
 drivers/net/wireless/ath/ath10k/testmode.c |  6 ++
 drivers/net/wireless/ath/ath10k/usb.c      | 60 ++++++++++++++++-
 drivers/net/wireless/ath/ath10k/usb.h      |  1 +
 drivers/net/wireless/ath/ath10k/wmi.c      |  4 ++
 9 files changed, 161 insertions(+), 10 deletions(-)


base-commit: 5dbf2415ca9821a611d09308e3b29d2c37e7cd77
-- 
2.43.0

