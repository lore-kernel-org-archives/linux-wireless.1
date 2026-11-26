Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709699;
	b=v5RGv5/yPAsEp+FAhQbv7X2wdVVQ3DoEuvziwU/iMPCMu9FcnmqIpNISEWP1FwPy8pID
	 tjmYMxxHcEwzAWe1S2C4EtAhM+R7gu3H+aiBCsrkicHNS0+OhIfUJZCpDAgT+73T5+uK/
	 Tg3Ikhr2IdE4yYAoSv3HxP+/kMyjWr028+vXvTq7c9ktt61U2i3APJ+3cQDpHMHudFQZH
	 CkqTYE/7YKjBNsTdTc4f5Cnlr3gTnSjzsJePogAJ6B9muD0SJkJNbI3u7YP8vUFOqgTRh
	 yoYm3PKV6LFWcdDipQKZ7BY87JjKdlj5Zr8qpPRQg+AC36Ag4eMdjGISMpLQD3ozDyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709699;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=qbs+BIoxoJt3KJCB4NUMQ6hrQHuhNkcUXUoL68Fd/0w=;
	b=4s4iiARxBYAFSaXgmPbyzCJy4lnpS7LcaMvANpyvfYtToi6C9UUzhFWHrKwV4BZCtQup
	 S7u++8obxCA9xOqZzWpifBEtX8UotWrOolCHJCI2kjgK8k9s137bHyapW/08bQ9gTzWui
	 W5o5CA565H/yeG/1iqxfsY9awZ9tSHxIroEujxRaEvvmIutnn9QQfvvd3huAiXn7I+3lF
	 xtS1Emg7mC3TpeuSM6Mc3Xee2gZPgSgp7sM0dJGLvtS3MdqfkMhyzu+b+nZk1r/k6l7Y2
	 fxvgWa8Aci9idBfq80u6BnKdQi1GwyUs5NNvKl0+W8j/zqy1OiP5svOk+K+tsSdhh8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ct7OBTWa;
	arc=none smtp.remote-ip=209.85.210.228
Received: from mail-pf1-f228.google.com (mail-pf1-f228.google.com [209.85.210.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5C0606A689
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 16:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A5C0606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ct7OBTWa
Received: by mail-pf1-f228.google.com with SMTP id d2e1a72fcca58-8a9f9473029so5419450b3a.2
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 08:14:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709697; x=1796314497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbs+BIoxoJt3KJCB4NUMQ6hrQHuhNkcUXUoL68Fd/0w=;
        b=BypbOq9G+AJZhHS/5tBIcRQK99iBRYO03s7+3L52XRPtAmzpRA8ECmLGsKFSey1vnl
         h5bS0K/ilss/r4OIYp3FntojGyU4ncF3yrClJMXs5lkGfN72IxHe08yMQIjxpKeBLZ22
         TngQi2VQf3Hf9oQ3zS98wuWA4/rLbC7Le8rHK3Aco6NKUpckhbMALf+eolMdHxcNipHY
         HJczD+r17vzwyMO+A/34wXnZIVM1/hFbSG4sMfAtPyq7mCi99ApiLlYl4k7hmPwU+jJf
         5PO4pt4TzG6Hiz8hxFHKTKigvf5bf44/FJJiTz8AtERgOU0XRPwDaQBG4K9hSesA/qjc
         Plhw==
X-Forwarded-Encrypted: i=1; AL+hErHVuM1wMG9GOKcTjTkIWTO7HpMm5d/oz4F0PnmE/osnRDoczcmwbC+wJcN9u/9lDgaMs5Ab0iOSMJ3CTtOvQA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+LytssvSiwU2eyAKOQRz8UEpSuv89qIOXKaXk4GlFJ8J+mPQzt
	rzOYfhRLqin3oH/D8MYrC/ysZ2WMBfeH0Xymz2w70b9/uPzsXmDqIYagJo/h83x9+a4F0lg+mI6
	BsHMlkdWJWh4ezcpwBRud7VGtl4IidiHXr4tPLoKvF4MNLVW0X6jnscaLGtwtQ0CzZEy/6JlNsW
	qknyW74ErupgEyewlpCW1rmSll33OEGouT1D+rkfIzZLpJ44kc/KHFBiKvs/vt+YOZQlSX7xbYs
	CxpK4i5NCV7fde60N9jBcUx4idm
X-Gm-Gg: AZFdTZdynq+Dxwo6/ipFnmmDEjheHHmSkL/4cxFp8U5Vs3kqBeJhE2KthZpMAZF/fq9
	gbHvILxpnOxjPNO9Wy+KYvuPW8877i8zcypG7WMMO+VQTewgZc5IaCS717uTi2Sjn0wmOzQrF/D
	a1GoeBJ3OH+3ba3AZMCP4EAhckI89VtGl8QpMZb5jnnopAjIJw/9ny38dgjEacfmKBBtCyCkAK4
	X/q1AzqeCxajRE88Au6yObDzubmnUI+ktGfA8LT5mWt1ZBshR541YjmtBW4BBDqgzVgD5KGrGC/
	hBH2kXGS+XDCarAsyKAxeDd86UZ8dumurTOXZ6EbqhWuVZSDZ6bYik2RHv3tPe8ALYLK/IRLy7L
	Y0U76w+6clelj/vmQ3FwqhE4l65+qqqJ5SDcPOmoMjhKAkVxP7uPWkmihrOt2Z8iIMrbnXN0Xjb
	5jUM4bnZ3kkhTGAEslNDJuuixMIv52eC1IY/Vjf08=
X-Received: by 2002:a05:6a20:c992:b0:3e2:b31f:b3c4 with SMTP id adf61e73a8af0-4014d254881mr21828516637.43.1795709696919;
        Thu, 26 Nov 2026 08:14:56 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cde6ceaebbesm154768a12.3.2026.11.26.08.14.56
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:14:56 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9496ff065bcso964322685a.3
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 08:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795709695; x=1796314495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qbs+BIoxoJt3KJCB4NUMQ6hrQHuhNkcUXUoL68Fd/0w=;
        b=Ct7OBTWaT70Hlcd8Xd6b+0r4nyZ+thEcLgNZGNuBoRF0vVY8wCVja1rJhnz5Z2sEw7
         rG6az3ZeY9CHZo9IwidVZS1dblSLiMM/Ko9dZ/VaZ1d6pO6DyRE6e5oGAJ4lgBuWok9u
         JcnrieyO/BegGKiKYMqG/jACVdusSzds7bxqg=
X-Forwarded-Encrypted: i=1; AL+hErE22w5aGFqw5hsBeX8goNFgO23M6hT0zUicAk+5VbRt8Aq5SdnfgXjjU0mufvUcQxE60Sli0EbCR81QQNSgMg==@vger.kernel.org
X-Received: by 2002:a05:620a:468d:b0:93e:d051:8f19 with SMTP id af79cd13be357-949ba9b3950mr3803210785a.40.1795709695417;
        Thu, 26 Nov 2026 08:14:55 -0800 (PST)
X-Received: by 2002:a05:620a:468d:b0:93e:d051:8f19 with SMTP id af79cd13be357-949ba9b3950mr3803205785a.40.1795709694974;
        Thu, 26 Nov 2026 08:14:54 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949ca6a0693sm1377617285a.20.2026.11.26.08.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:14:54 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Sasha Finkelstein <k@chaosmail.tech>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Aditya Garg <aditya.garg@linux.dev>,
	Yossef Osman <Yossef.Osman@proton.me>
Subject: Re: [PATCH wireless-next v2 6/6] wifi: brcmfmac: pass AWDL frames and role changes to user space
Date: Thu, 26 Nov 2026 17:14:42 +0100
Message-ID: <20261126161444.2484980-4-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261125190254.176055-7-dev@deq.rocks>
References: <20261125190254.176055-7-dev@deq.rocks>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 25 Nov 2026 20:02:54 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> User space runs the AWDL election and peer discovery from the AWDL
> action frames of other devices. The firmware reports them on the AWDL
> interface with ACTION_FRAME_RX and AWDL_EVENT, behind a header of
> version 1 (16 bytes) or 2 (24 bytes), and its AWDL role with AWDL_ROLE.
>
> AWDL_AW, AWDL_ROLE, AWDL_EVENT, AWDL_STATS and SDB_STATE are event codes
> of the Apple firmware. Add them as abstract event codes, mapped and
> registered by the WCC vendor module like the CYW module does for its
> events.
>
> Pass the AWDL action frames and role changes to user space as the
> vendor events AWDL_FRAME and AWDL_ROLE.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/awdl.c        | 110 +++++++++++++++++-
>  .../broadcom/brcm80211/brcmfmac/awdl.h        |   3 +
>  .../broadcom/brcm80211/brcmfmac/fweh.c        |   8 +-
>  .../broadcom/brcm80211/brcmfmac/fweh.h        |   7 +-
>  .../broadcom/brcm80211/brcmfmac/vendor.c      |   8 ++
>  .../broadcom/brcm80211/brcmfmac/vendor.h      |  12 ++
>  .../broadcom/brcm80211/brcmfmac/wcc/core.c    |  39 +++++++
>  7 files changed, 177 insertions(+), 10 deletions(-)

You may add my acknowledgement in v3.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
