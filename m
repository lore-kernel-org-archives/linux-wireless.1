Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595867;
	b=IL+691hn/4KtsfSp+XFxWEP8aSUrQdZhN4MCiNP4FfyEyMConi/xuMaiuZehtFLvGCxk
	 jex86B9Awn4eeNKri16zDfVl6qCsM/IOnyDyUD3GRPxr/W8lU7nuKYslp464VNV+CfwW3
	 yczysV+R922XfFcwjIROxQW71yRbmNEn0oKh4f02yQxxLdSW5iBW+17ITfklQLyYiJSOS
	 DWyYIcdznDyy7vCKBtdcjpDrhbTYJfBeplb8mgLxa6A1wNtSsMlPLDCXY2ezo5eXEtVqG
	 2a22VAg6/6vmN4x70mEJUO8gVYtRZ29dCVmvi0rt+Fzktt9HvPF25BOVqBNsidgZ9yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=dh8b5LXR3KiiLkuoiCOtiWjtpyywRUff5GPX2NXRZ1M=;
	b=0rYXf/5GOk0inz0I9D+HASj9/CYGIhKeT7yBzuT5IN/GcSuTUby5NciV7NbKlwgNElkX
	 ovwgurKOehAhI04LBNkjJckdHmmIqSPed6r/i2TSRRlSzcwvu+MkvR7tGnj8RtCVojF2f
	 Ld0F17zQQG5gHkYkZDTqCHHXcuiVYS/frLTS7/EUhbACDOAcgh7LKMArlM/yBOsgNXVqx
	 07XLloe7AIL5h6Nuh4uKnVe8V1XJwjNVmiJMf6eHBIsAls95SuO5ahFcrkzKm/TMJk11g
	 e3Ny8zVijtHFh1yt90DLzJiFqdRXkif1eemyUqj63+xK+CbAB4CxovPT2mImqq7fJkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fnUBibtK;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F502606A31E
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 08:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F502606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fnUBibtK
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-38190551625so10968384eec.1
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 00:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795595866; x=1796200666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dh8b5LXR3KiiLkuoiCOtiWjtpyywRUff5GPX2NXRZ1M=;
        b=fnUBibtKjtkg62Ax2d5I2dz4bNfkualHt1VdGkQ7zd3khdys5mqOQM7OgzD8wN3cuM
         mlHYuAgAweCup2Q6740w/XGlGyNQSocdvqTzKnSKWDBwYRbHo8POudFnfV/w/E1ceYPu
         9hwmfm147zCEOy6AJRMWUOAyQcvaUmq65BJDnAzSG/O4+26j6lgfMIP3tUK3LlvBehrz
         0GSEnp0YGdvTYyNcP1SwGhzVfJbgib5TDza3XQ29bWanBJv9wGivy9AjoJEz4he4xUiS
         wYTxtku4VhsDJqrYKOoaSOuhvX5siJl5YYVbIaIg9camyHSst5QWhgMitzxel7ipndV/
         qO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595866; x=1796200666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dh8b5LXR3KiiLkuoiCOtiWjtpyywRUff5GPX2NXRZ1M=;
        b=uw+k+3j3vnANx6KEvnI577xsWmzlI9hWF0vRyHBZmEpRo7o2dJszjphsO1wIbUQOdN
         UU6gkHC0BU6RJacdc1YUv9e1exFQxLML6z0WtLMwPAeDzpy4xnPAIugbBF4paqISVK63
         X+Tkx+GZzwUQKH73I1dTGpqetAC05ac6j9DUK56CxECB5k4rhdce6yNDrXaqE3+U2Vut
         7Zu9eTFIxsQMgFeNr1YBF/ygPJKnKeSgxaKSynBaBnqFxhT0JsUVLMQ5ILexSD7umwBv
         HAQauVBvG6juFY8Ri71j1M9FxlvT2Sfr+bXnacwfeomo1YW/QdoKtJSBLGKdCuOsJIoz
         128g==
X-Gm-Message-State: APuU4Z/Qp0pi+MVZF6YA4Tm0b2Z64kaxsattlh5bXLoV3MUNHnwpSQ3i
	POX2SYffT9SusajC0PgJuMXrnpppyERV5AGqp1mwOYC2pqziFbvB3ROu+DEhsQ==
X-Gm-Gg: AZFdTZf2EcY+oV2VYeV66baOml8Qj8X3oi46EUILonhdmI9vXxVfgm2O9BDBc88ABu4
	Zksz3d7/NjZCaB/apAAwETe9jEvw+deOSiW95mFRa9sBiQrQx+EJyDfRi75Z6sQQMAakyS5w4yi
	LhwixculKbxERTtAmvM5DP4HDdS4FIL3khV3QqCcdKfWPo8wf/aDzdJZ94ajWmsdB7qXraSeqsV
	NLyRMIoEiWXGxxHfiZJHXcNYsgLk/ON57KlW4I//78Avv7zhb1Lh0RlmO/ms+hEsIQgXeI7uH27
	vvgUsNNHlhOSYrJqzRGijl/8Oxx33lV5HK2DLC/DckbHjAzNyr/DSXv7vSh9nxJ2ZHVFm4uI1nm
	om75dnPPhWHQ7PaWzKf+vwCHfORLRpIN849I/sI3MCSDAZKzjWn+i4CNuR3rbaj05FMYzp4VpgB
	+z6S49DOU1NjRITXKU0wUAzmD6lKDSLdWY260ZOxbJnhOwlsube3Ez+yLQhvyEUc/L9Os9H5zJe
	/rWgp1zNPl55qWktzR2owJ/mas8ttgj/sZq9irzX6h9KQrXJkhIWZXiG9gowZx+32qMgQxehxyx
	ek9CBqVs6Sly3QnZ6BZ0IrAn3jmMoSKczkgAxeIlaoGX88vFe1N6rA==
X-Received: by 2002:a05:693c:8859:b0:386:b494:864e with SMTP id 5a478bee46e88-386b4948821mr6521731eec.15.1795595866205;
        Wed, 25 Nov 2026 00:37:46 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3866f299d0bsm43927422eec.19.2026.11.25.00.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:37:45 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH iwlwifi-next 0/4] wifi: iwlwifi: validate more indices from the firmware
Date: Wed, 25 Nov 2026 16:37:38 +0800
Message-Id: <20261125083742.1355074-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
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

These patches add range checks for a TID, a BAID and a TX queue number
that the firmware reports. Other code paths already have these checks.
The patches are independent.

The missing checks were found with a CodeQL-based static analysis tool
that we are developing. Each out-of-range access was reproduced in a
userspace harness under sanitizers, which report nothing with the
patches. Nothing was tested on hardware. The patches were compile-tested
with W=1 on next-20261116.

I used an LLM to help write the harnesses and these patches.

Maoyi Xie (4):
  wifi: iwlwifi: mvm: validate TID in TX response handlers
  wifi: iwlwifi: mvm: validate BAID in the RX path
  wifi: iwlwifi: mld: validate BAID in the RX timestamp update
  wifi: iwlwifi: pcie: validate txq_id in reclaim

 drivers/net/wireless/intel/iwlwifi/mld/rx.c   | 4 ++++
 drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c | 8 ++++++++
 drivers/net/wireless/intel/iwlwifi/mvm/tx.c   | 8 +++++++-
 drivers/net/wireless/intel/iwlwifi/pcie/tx.c  | 9 ++++++++-
 4 files changed, 27 insertions(+), 2 deletions(-)

-- 
2.34.1

