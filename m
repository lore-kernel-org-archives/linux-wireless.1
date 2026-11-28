Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795882849;
	b=p486uWf0H6/Pao9cPS1+gMRpYWoJU3bjFjrliXhPLCXFiGz5kP6mGUqNqBQWdx4O5cTr
	 YAXge7bh+8riOI4wSL7Vx/kmYp0tXNCJRtBhlXXGITBIzZh/qwez2hyr5MKlLmY1fdFJv
	 cU6f9wlqGRHS28+y2LKZUO3GD73Y5opcNOJCUVLWsgEzgjLcZAkrmPB6xt6+ai4Md7BCo
	 gGhXsROP80FU7AIlKCVqdrfGnMAmIACGNrJGyt8/nLpNc6yKVr7wnivWnB4P6sRKpIwWA
	 2hyHrh9bkLoxciYdOFn3xjrClfh56OWVkNbTBT+tzAMGprw3u74SY/+Uk2QGapgGIxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795882849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=D+8QP49YMFroNM6RVv5M8lHNnUxyk0QDBwrPHQld9vQ=;
	b=EsfYKO/nabaC9Ca17sKlWrWk86Fg0at1U6HwS1jx2mvH1LPBo6UEWiShSttdC+goSZzV
	 jekPMa2CoXA3FiBtyeFIHvJWV9XfRTR+h3eziez2jFf2kO4bMikKiBTT6kE3dJTDL7HG9
	 N43Q44KZrfPa0Avp9/E0N6bCq7Z+pvBokwJZGWbDSckMCe60uMWBuVOI6clINW3HnFnuL
	 diD0OpPZSJhhe7IKf0WVb1mq2sHqrUjYKwsm3W8iYgNWsNd9DikcEpAYFV9rRo5D3cGho
	 SEWI8Ldka8dPKvHTEC/1chAuAEblTEBwifm/OwjyaFIMjAGnCZRDUmKnE4lWduHh9Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+5Glqm6;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07DD606A31C
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 16:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E07DD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+5Glqm6
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so92397925e9.2
        for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 08:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795882847; x=1796487647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D+8QP49YMFroNM6RVv5M8lHNnUxyk0QDBwrPHQld9vQ=;
        b=v+5Glqm6ZsYwzQ0/ouE2LY47mqNdqgh45vrQJkjo8L9jooN385/oME2t1Vij+5rKgm
         rLhB7al17jCgaNY3+BXrwCgMB3mbxhfYwQZGEQJCDe7y1ARUX470B7XmT1Q6BC4kJPtf
         6/rKKA8n2iQm8NSoI0emRc7s6v1XO55sfpAAf4IHA2fdRLz8zrgNXu4fZ9bamyXAUMn1
         BQrXZ4sLxJPw7xE7pkR2AkfVqfJNFrtSVDxOSYaBz9nxjNhtksILx0hs1UzIwK1iR1v4
         qdXXj/rT0DaKs6tvoiSKuYPweU9QvrEV2h0s/kYrQOyZo+7796L+skd2tR4yNrbIW0/5
         wPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795882847; x=1796487647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D+8QP49YMFroNM6RVv5M8lHNnUxyk0QDBwrPHQld9vQ=;
        b=0v0XEqIcINWZtZzyohWZC5xf49JWLmLxhUacs3TVTxT9de+zCJ/xMoVmqCQ1d8Zodf
         dXxEWjnDJtATqd++dLC5ni6Iklrc8siRhDgLX1BUuYa7OFBpAU1e01Psvjgp7Xh/QEow
         qqCgphNeHPQUOzG+UXdjEe3rnjAgmEIyGV0Y7ILEWjk2yhWiFVWoc+W897T7ODA+nzTY
         DV6NJJmGDenoqukXNIB9JKhsuJAi1/a/adrs44SI3B55nYONNnj7X/iGlssJy1Sie9Fo
         abtDdBY/kGRcWLuDstc9oSvdgtTKHjUUX5mpprAVlnlw42pWU57NyLVSdwYqPhOjwrXy
         lJGA==
X-Forwarded-Encrypted: i=1; AL+hErGwznTSmFUGKuAkYvS7aNnrmYYBHDHILHted3kyqMpIhaEeYIGSlELz3VrV9EyjJUyL5iMbdiPYKEa9Bbsh6w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8IyMihQW4Dn+ypVBk8XyvUYtM6ODH/bdAGUuKReQJoTkHPOIGD
	dhw77nsgmS9+vR52fPDpSdl9cwDwBiXfJWs2Lr7UVA6T3CCm6musMm/Z
X-Gm-Gg: AZFdTZezR6mgubGOvNSYV17nSAuy/lbu3caozo3d93bJEH5qB7v43ZCyI19ICm5jpZS
	VoBpJf3BiCQUQygSnLM28jEFSLWTgemr45pUaUMNqAXSnWhbDDkxtfxEHsphHSLscTfvvfAfKs5
	FRpkbdOOK2EiBDKf1/4sZi3Kt5Pb8zZse8gmadsCFL7ru7n7D/hDuKOcJx56Iv1HdAmuGPdTkD+
	maO7mx4dr5dcEMByupgPQMK8iCoSdMNwLGN4nvwdgoEsnkYz/THH5QBiRUf6fN85ByXwulWtfHF
	fSX6xwHXm67W8NLycmvEXVNysWAxgwIlyYqnf5O10mk87fuekdxUJreJo3w0vvyc663FqCJDbnh
	RseIm3AtpMDb3iubzQhKQ4EAOttL9ay1jLCsOIVAX7nodSo3uGvpgaDR1V0jCJCE0VQpOkFuNK0
	CuBnddb4/k2wS/qGVfnzHr4LYn9EoNYiUVuIr+T3qU9H5wgxYDe+2rtkVbhC3kAFBS5UdSs5Grb
	yagAHCHrkEgy7DhNInSFGi22pUe/kYbyh5ZLkqht2c+dMgrF+xoFxoOxgVya7oDlbld9qxY95Br
	TtGO94iCrwsVQKES4TkMpzclkDdJKzMWZ1NgW2k9Sts=
X-Received: by 2002:a05:600c:6744:b0:4bb:afae:150d with SMTP id 5b1f17b1804b1-4bbafae24acmr162024675e9.33.1795882846959;
        Sat, 28 Nov 2026 08:20:46 -0800 (PST)
Received: from fedora.kevinsoyer.org ([2001:a61:25ca:5000:edf8:6430:c80d:924f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm819054785e9.3.2026.11.28.08.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:20:46 -0800 (PST)
From: Kevin Soyer <failforce@gmail.com>
X-Google-Original-From: Kevin Soyer <Failforce@gmail.com>
To: baochen.qiang@oss.qualcomm.com
Cc: jjohnson@kernel.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH ath-next v5 00/11] wifi: ath12k: resolve RX link id via logical link id on WCN7850/QCC2072
Date: Sat, 28 Nov 2026 17:20:39 +0100
Message-ID: <20261128162039.18561-1-Failforce@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
References: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
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

Hi Baochen,

Tested the v5 series as merged in ath/ath-next (HEAD <COMMIT>) on a
laptop with WCN7850 hw2.0 (Quectel module, subsystem 1eac:8000),
Fedora Rawhide userspace (wpa_supplicant 2.11, NetworkManager 1.58).

With the Fedora 7.4-rc4 kernel (Linus tree 4dce97c6c265), connecting
to a Wi-Fi 7 MLO SSID (SAE + FT-SAE, PMF required, 2.4+5+6 GHz) fails
every time: authentication and association succeed, then the 4-way
handshake times out (reason=15).

With ath-next the connection comes up as MLO (valid links 0, 1, 2;
links 1 and 2, 5 and 6 GHz, active). 5 of 5 connect/disconnect cycles
succeeded with ping OK, and the link was back with ping OK after a
40 minute s2idle suspend.

With ATH12K_DEBUG (debug_mask DP_HTT|MAC) there is no PEER_EXTENDED
event and no "failed to get peer extended event" timeout, neither on
connect nor after module reload. So this firmware does not advertise
WMI_TLV_SERVICE_PER_LINK_STATS_SUPPORT, and the host allocation path
from 8/11 is what makes it work here.

Unrelated to this series, and also present with 7.4-rc4: on every
disconnect I get a warning from ath12k_peer_delete_resp_signal(). The
HTT peer unmap for the partner link arrives before the WMI peer delete
response, so the link peer is already gone. For vdev 0 the order is
the other way round and there is no warning:

  htt peer unmap vdev 1 peer d4:0d:ab:33:b4:64 id 7
  failed to find link peer with vdev id 1 addr d4:0d:ab:33:b4:64
  htt peer unmap vdev 0 peer d6:0d:ab:33:b4:65 id 4

It looks cosmetic, connections are not affected.

Since plain 7.4 can't connect to MLO WPA3 networks at all on WCN7850,
would it be possible to route a minimal fix via ath-current/stable?

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Tested-by: Kevin Soyer <Failforce@gmail.com>

AI coding assistants helped with the debugging and drafting this
reply; the results are from runs on my hardware.

Thanks,
Kevin
