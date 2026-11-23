Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447843;
	b=DirOVi8MjJeTlyF6WiGhQRZPYgv1ZpulXB1D5wieX6Dtcn4FsmTkR17kD+yy96Ps2VhS
	 x9LupOuZmtqQ4mFQSapaiqx6E5nU0HCNwQRI7CVGh+CuDGQJZwnU70nRXQ4PYTgfbIlxz
	 gCGGs7bwD05EShOZF4Z/6DuVg9x0tmwUSPCANSG5pwY9wHDgG45cbYURXXa+n1Ofy+cFu
	 XWT1eA6A72GK9tCKbL7LPBbEPokRprg2N16iXeq3Tqd6Snc6AEZzrrodcWiHwuhNmT0zs
	 /zUHwujmPFFK9w4wKUML7WF+TJN/5ECuFZNrOjeSVSUwwxtH47XvaBh3gmH6IuBfnXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=sErmmbCd/7zkW4tnm5tJmTb2q3NnWPyBLOCt2pCMa9c=;
	b=OFT2AvGe2mFB+nB4BK5o9rcHfhLJcO7vfN2706eX1XkGv/5T1ktHTTkMS9I7lixP6akE
	 ReGgJXmibNZS1vu3V+oOv3weZYP4E93W3xR0GvRvJvwpjXttZ4n3Z8Ho8k3Tso3a1ryjB
	 /TRMe4qIgxKRc2z3Z055FAq4/unvbbhbVQdsbcG6Z7GCHVFcOkOP+VH2WdTynU/RynvU9
	 lFpktt9+4kWKaOsmUXQyB6Q+rMOT2fGRF61GKtniXHuAx93BuqlGGzr+tPR+apkV+hU+c
	 QAzwGEl2LaIamTtUDG+S3ipPpC0Hxa48gq43iZDf35HRrKJ3hYpmWpfxUeRT5RE1CnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0E6SnJwm;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A0D606A31E
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 15:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79A0D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0E6SnJwm
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f0634667aaso9764245ad.0
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 07:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447843; x=1796052643; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sErmmbCd/7zkW4tnm5tJmTb2q3NnWPyBLOCt2pCMa9c=;
        b=0E6SnJwmVmiELiSD06e7SW3fnALkoVfF5sGjAf4V/fk2jL5vpqu3CiDPoPO6fuTJdU
         DroTj6gZ9CCR/eAwedd9C/9jQtKbUd3KMOXQUXl5ILGbt6j++pBIhAQz/Z3uzcKTUQIu
         imhdP9W5TNYzX63ZwkYX3hraqwASiixtdYK90zP/HRbMU+pUnIPFkJ4xh9EcwZ6U3xH8
         v7gOZgd52RNB8A9akq+H76HUF5gHlikYGFku8pokxByaKkMPQAGcprTFiVwhGn/0d1fB
         NxvyI35GKB4Vem7nlBr/jHEnoaeCpbZG6cl/XSfmdYUtBExSfLDUly5LFRPBeKBTS7aL
         OSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447843; x=1796052643;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sErmmbCd/7zkW4tnm5tJmTb2q3NnWPyBLOCt2pCMa9c=;
        b=ofBQmlAUjYfEKYoGBv5BeQT4HZuYSvh3jkAUky3sSNj/gH9BNcBDi2AGYtl5Z3BX3Q
         x6fKKXiddqJdCQN9LMdXUDFCJqgGUcyog91SUEl8RElEv3Y2pyCN0yJVmbZc+EvwqmV/
         uh8zpWa1YZfV9u+rQse0PrkJv0nVIG4EZyJ3U3qVahqxgL8GMI+wyJjpveRwhZPu2jGh
         utd4irp7/HRad6zgUW2UCcaUVHQLLLZCB38PnoKJNT6Tz+tYEovuk9C25fsm9idBWOmh
         pDALvnvbukQMHaI8lX/1fX6/8aSNUXCR+P9Nr+5rl22x5BIXwq0KpH84+44ENCh0C+I2
         T9dA==
X-Gm-Message-State: APuU4Z+AovMl6MynYMMwxMaElGB/vekPphNhW/GsjSWN3fh2xMWotGKA
	Kw0N1m/+vjdQ/pG7wQxKScd8Whg8iVLaTY/JhB8HLL64I43iiPnrRoUNCzoFj8FP
X-Gm-Gg: AZFdTZfTHCvFbt+nhA3MEWgAjeN85RYOdYJumcc2t3o2dR17J4ljXJZe3HspI/Nvj9i
	hbf9PgBQZldzpLPR4qo31JCpKI0VX4PDP+YUaLLqOiiTN9e6CroMMgAcnXcIwwAMovzxCUE++gu
	U9I/gvS9Ugb8F+whNRMsvVXMtSL977h7DXs93PeNeawvc9j5dZKj4ndlKoqcD2I7rL2rNIcb2+k
	Cbkic5cNXTpNy6kfUPR4kSdPAYjPOJPLl958p6GKvXUXXweqdLoUaHCss2v/qioXZT/IaFJMQLr
	FbFUkUW8eEIS60YUlOgAQZDouE5U4s47dpwgCN1StoN5soH+nFBrUdFi/xylNi3TPFcTaHNM/im
	0R23d90Mc8+f3+9j4+oc+7PAC4XVFPWBiaD6/Dw6BjizCp5ZkVrrXYw9lPrbz4Q7e4Shk/34GYl
	6DVly9yqC58ia4wGBaandGdUz9xTHxKaLds54CmZbzTfkWmPS8QeS2IAErKCa5HBr9vQlMJZH5Y
	ufuP8c+nlPHA5YRzPqZDZZw1NRVTi5VBl3Ij45kjpu77QHmSHGpgOT59JBaab/fUsIbJli+GnJl
	DPMSUl8BR9fhK7mmjx6/TrNsp6ofP31bMbVN3Kd0FT0b8lMtEwm3usUyrZjZhs+v
X-Received: by 2002:a17:903:2308:b0:2e7:67ad:8e9d with SMTP id d9443c01a7336-2f03f1ea592mr90164365ad.30.1795447842512;
        Mon, 23 Nov 2026 07:30:42 -0800 (PST)
Received: from [192.168.1.102] (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f12028dsm54161655ad.60.2026.11.23.07.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:30:42 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH mt76-next 11/20] wifi: mt76: mt7915: send mt7981 only
 the group units its firmware holds
From: Zhi-Jun You <hujy652@gmail.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20261123134920.154270-11-nbd@nbd.name>
References: <20261123134920.154270-1-nbd@nbd.name>
 <20261123134920.154270-11-nbd@nbd.name>
Date: Mon, 23 Nov 2026 23:30:36 +0800
Message-Id: <179544783624.713271.11609530250117945286.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795447841; l=883;
 i=hujy652@gmail.com; s=20261123; h=from:subject:message-id;
 bh=pdJ3XcjJpL4AfCsrEk1DMQCL9KXXuqL3LlQPI2LAVfw=;
 b=AqN/GUxkD0zBkWt/SzWUlfH9FD8Y3/i+mRYm5MoegU05ZqCpSmjhmxUYQuxk/P4n/yGYiLWhw
 +F46pxsO0QOAEXFL9YLYiWzc9B8LLI+OKfNfvZ+VfWEr87WX66j5eGX
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=MXiVj6rTyQLjK+RN0A0WiriSkqHj/WJPKnbDVaSWdgU=

> Since the mt7981 group pre-calibration size follows the vendor flash
> layout, mt7915_mcu_apply_group_cal() sends 144 units of 1024 bytes on
> mt7981. The group store of the mt7981 firmware holds 94 units, as on
> mt7986. Its handler checks neither the index nor the length of a chunk.
> 
> The units with index 94 to 143 thus overwrite 50 KiB of firmware memory
> behind the store. This happens at each probe of a board with group
> pre-calibration data.
> 
> Send only the units that the firmware stores. Keep the trailer and the
> DPD data at their offsets of the flash layout.
> 
> Fixes: 2b660ee10a0c ("wifi: mt76: mt7915: fix mt7981 pre-calibration")
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

Hi Felix,

Tested on Zyxel NWA50AX Pro(MT7981)

Tested-by: Zhi-Jun You <hujy652@gmail.com>

Best regards,
Zhi-Jun

-- 
Zhi-Jun You <hujy652@gmail.com>
