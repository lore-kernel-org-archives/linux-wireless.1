Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825726;
	b=NLw6VBKqd3+8HX9g25XvrTgmKc35O41dlmuEym3WXhAxm+DDqzxMGzy0rs0o//+1y4eJ
	 ENCQz9M3/aEUPrr4qn+sJwXiO1pSXLv28tlN9UpCN93cQOj0kiRsfnl24TeiN/AkEiWPV
	 dnU0soUbCeueqEbaWKDzf5I4Hio1SOef7Ia1KL32p0Vpa/Y96DKZs1V3J8sQwWeHQxscP
	 5ViEEa++VM7GFPYhHDtEcvhFvYL+FY7ArDniZ3Jyab4x3PBP7N7zDKegEXCrQTC+GiVnq
	 Aiep7CYxRWBeD5UFAr6wh9rGBP4kJgQYRiZMx4Yyn5BekWf8+iarhfWnsg+Oi5xrP3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825726;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=3TnZeP/Myi6EwsvWImdUdCOwfUWWi1PsNVUc8BFWuNU=;
	b=w6aDs/vX7NP+OHh83kjFid52+HZCJvMOtsxhsrpNUe0vF9jvKFt504x/tMWWRKsU5A+a
	 eJwKDvketYCLWJ4m4Rj061oe2vqG4G47/uCzUnlUEs+Vn0irP7aWGnXIrgiE18q2omTtF
	 OKabvVuMQ23B3Ve+ky6b+1u1bm1bW8kOUiri8zGdWMVBzDCVhFPFwJfjkW4l7RtDFwUci
	 ifQxA0U/t8xNCY2QouSmXfQ+R7ZN7W9avXhQIRDExUABwGMx6/WNmFCaGzIkloth5mTZr
	 L4Le5nd4Ji8VTtVbIgQ8+2uz7NtzhBXOdQJfjmfII5j5abq3arj0HmWzv22TpxSX1HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XMQ+zHVx;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B557606A323
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 10:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B557606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XMQ+zHVx
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so2136994a91.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 02:42:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825725; x=1795430525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3TnZeP/Myi6EwsvWImdUdCOwfUWWi1PsNVUc8BFWuNU=;
        b=a1q27AFA15Iu1v2ZTknmnVwhgFUO8OgoPw0QxYjggphaDlrmrbD6KfWAjYr+8Zkmht
         HggNHbmyvdaQPx4Ea9hCGogglyzVcoWzqM2nMQTZvZTf+b+S6rhhClS39Bk716e7ojq8
         noOY5mpwHI9XiS52DdbmVSV3MYKeATOgXGJH8aPhfK8CfTb78w+o5cWEQnPDp27QMB3W
         WAPKd/+Imrhy4bN0cFLkYY22Q6Z2BV4Dygc2Q0pej7hz59cVT3Hh21ff/KmYDUCFyDow
         SGKp/VHHUz3WnMAnTDu02oO9HxL30feyHhKl+AbVlwC0wdQb0JQACOl2cTiG0b9bYMCP
         qHAA==
X-Gm-Message-State: APuU4Z/CalBKGdZwT0XbHTqp+KKtW7ArI3do1CYJyyhV1L+CWIuiMPat
	JbN3PM9W37HY6CWQJbhZdbelYDeK1GceAb3lC/tvsDpNGz9MhAnzuWJoQuWcbqLu7HIG4NcHQzi
	ZMbPRFjiveLw1buQpMD3JhxB7mtHO2ecdPIBln5q/4hNhd6Hd0eFpiZpZfKBy8HsdXM/nCn3b3v
	OmOdbDqttv0TxTq9aXmeGH4bMXnIVbkOx0p8ACkdcCHeJvKvfvdVf2GAL7OsHTyljOizy0N2OA+
	yVu19GY19vd0T3U0TBN93jdpwNh
X-Gm-Gg: AZFdTZdIvTslaqqtbfGkwe/qVSO/Djk40Iw1sKOcVoRm/5XE/U3azjLasHyuizS9XI8
	/xTYGkV1MG38dVPZssSL/pJV80OrkwSQ74wymmeOpohkMH2JbPFHn6DG26uYgMYt192PPldAsZL
	I2nazIELHORaqLFRWmSkQLhnFaSALGDPJE6XIEcL+CwjEUgy59fuSnO9D2+7rhMteaTFdIWEugl
	IYMWWJosUEhSnohQ34nkDv6o3mZa3a2aQsnS4QSrQo6qZfrInctmh2rdEd36XVCcmeHwryMvwcm
	7ExGAD8V6BcbLf7eIkxNnciITgLq0rMo6tl7NSyt6hYl492Tcq9hq0jfzWh2J1zeI0Tli3qz+48
	NMnL4tuwOJYFG47hMxFRs2XjMRvTw6tzcWrMD2UBb7FyLjqN/cBIP9yIs3nmyxNyVT+yDi6pSSu
	t7HFnru0IhVHXb8Y55kkbLGRpFfgec+qs/W4g3opw6ng==
X-Received: by 2002:a17:90b:274a:b0:3ac:8ee5:e007 with SMTP id 98e67ed59e1d1-3b1b0a0c4a3mr8224536a91.20.1794825724652;
        Mon, 16 Nov 2026 02:42:04 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3a17086sm5849053a91.3.2026.11.16.02.42.04
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:42:04 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-536720195ebso65782261cf.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 02:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794825723; x=1795430523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3TnZeP/Myi6EwsvWImdUdCOwfUWWi1PsNVUc8BFWuNU=;
        b=XMQ+zHVxEh1e5eeFfYHEveiN5mG/652o5sXTBXsCTYHAkLyHfpKpGNevpBiQMM9VLu
         w64sKp/8LlIDyySP9UU/jAQV4IvZ5BTs7bZlJv1Y8m6pK1varUPVCFkfxlYRRdpM7yKH
         whp+W6e49eWi3xNF+Xx6alTa9XitHrJNLYgAc=
X-Received: by 2002:ac8:5ac2:0:b0:536:51d2:1e44 with SMTP id d75a77b69052e-55ac667dfc5mr167806921cf.22.1794825723522;
        Mon, 16 Nov 2026 02:42:03 -0800 (PST)
X-Received: by 2002:ac8:5ac2:0:b0:536:51d2:1e44 with SMTP id d75a77b69052e-55ac667dfc5mr167806701cf.22.1794825723025;
        Mon, 16 Nov 2026 02:42:03 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23efa2edsm82699996d6.15.2026.11.16.02.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:42:02 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Kordian Chmielewski <kudzo51@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com
Subject: Re: [PATCH RESEND wireless-next] wifi: brcmfmac: delete the flowrings of an AP that stops or goes down
Date: Mon, 16 Nov 2026 11:41:58 +0100
Message-ID: <20261116104158.3133373-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261110231145.206744-1-kudzo51@gmail.com>
References: <20261110231145.206744-1-kudzo51@gmail.com>
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

On Wed, 11 Nov 2026 00:11:45 +0100, Kordian Chmielewski (mlody1212) wrote:
> Do the same, and when the AP stops: brcmf_flowring_delete_peer() without
> a peer now deletes every ring of the interface.
>
> Fixes: 9a1bb60250d2 ("brcmfmac: Adding msgbuf protocol.")
> Signed-off-by: Kordian Chmielewski (mlody1212) <kudzo51@gmail.com>

[...]

> @@ -5480,6 +5480,11 @@ static int brcmf_cfg80211_stop_ap(struct wiphy *wiphy, struct net_device *ndev,
>  		/* first to make sure they get processed by fw. */
>  		msleep(400);
>
> +		/* the BSS goes away and its rings with it: nothing else
> +		 * deletes the one for broadcast and multicast frames
> +		 */
> +		brcmf_proto_delete_peer(ifp->drvr, ifp->ifidx, NULL);
> +
>  		if (profile->use_fwauth != BIT(BRCMF_PROFILE_FWAUTH_NONE)) {
>  			struct cfg80211_crypto_settings crypto = {};

This is issued while the BSS is still up. A broadcast or multicast frame
sent after the delete response removed the ring, but before BRCMF_C_DOWN
below, creates a new flowring that then survives the stop, which is the
problem the patch sets out to fix. The E_LINK down event that
BRCMF_C_DOWN triggers is handled by the second hunk and deletes all rings
of the interface, so the call here is redundant for that case. Suggest
moving it to after BRCMF_C_DOWN, or dropping it and relying on the E_LINK
down event.

Regards,
Arend
