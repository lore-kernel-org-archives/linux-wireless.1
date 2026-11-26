Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703399;
	b=uZ4yNEDBP7xBcPqHLH7f+XX+ehYdH1WlMJLLV6imxXv5oOc4E0MvQPoq5pcVRJYl6PnA
	 rii4iS/iclu9BlarvVbhmqD0gh6Dp7HPm46xkOPIRBmMJv9vZA/HbnPB4aXNsNKPM2XH3
	 leGNiv8PbdcgzVucPCFYmW4RdYxfX3XPg8ipCW/Fy9tj9y/Jk1QwIFGlNPh1y0JVmLqwy
	 UAmDPKp9+VXm5kvUbrZSkPIzjQYhgHT071WAG5bd7fXn/HuVXEGgdKjlrwhMfggeh3NSz
	 Vf7NzxLMaKquNU3SQeAgmvtnTe9rOXntNC8EH0IwPMrJj/9Y9PMXGvB5IG/cKuNOTng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703399;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=QXNKwdPJ04JREY+aWREtcoE55TXV8m+B7lstNxSiSJ0=;
	b=gxka/KvrqFgORQuZuaGIpXqZ01217z3LuZLCS/Ac6Oc1FwxfEbfRd6C6tGdZdKsU0tCW
	 zKuf/6vZ7wXVvZe02B+i6mbv7dCfFdxqkl8sKM1oI0q0H9M/LFEroKpNKxxF1MpVeZmEL
	 5dfqXSnud9L3X+2Nh7pCoOorHnyMj1/F3dVTTYCSvD8Z9QCBDR9WMNa7fn1YrIfUoXDqP
	 eKeVWMT0pNm+ZV0zewGOg+Cqmdz9cJYZb3K38z38YJ7IgKAzjwxALn4jMjln7bhgAtAKY
	 YR1c56gW4QThDINCSboDKvETQZoxsGMuoKxxmhM9wUtw48irC6mpZJPxOebASeVn2CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=E3qSJN1N;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FD1606A686
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 14:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6FD1606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=E3qSJN1N
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b41e5a1719so2955649a91.3
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 06:29:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703397; x=1796308197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QXNKwdPJ04JREY+aWREtcoE55TXV8m+B7lstNxSiSJ0=;
        b=M1L1R3/gL+c1/MbREQs+kSHtsgIPWP9IFu0wvKTVfWV9SNwc95NGPABTKBNXf1bGq9
         nX6L9N5G/j19vYlyUUm6WA0pwBbIPSaKT43TRT8S/3OKz1xiSLJN3d+ZeBv9q+OpLU/X
         RIXdGGc1p5Mvtv6fKFtPyypF75OLe8iHvE9266W9lgfKiNsXJHHy3YruVqnL6URH66Dk
         IIgVdOKkBjqAtQPm69caCgFGOmYtT+48bNKnRz5Tlxrmc5GUojgMTb3ZXn9mZSqjzNJv
         HDo3BsWw460wDDKXALOcbykr/NtEFrJCSdzFc3eY/k/Wv0kIWUdiODomqr6E4MxTajJg
         gu6Q==
X-Forwarded-Encrypted: i=1; AL+hErFvUKEvgoGu38+6Vm/Y/Hvpr9z7LsZcCy/XXri2ziP+5xPvsQJof90K0yhZFOPPm8OY+NTmcet4TwgFGNGliA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9eS7iwjUrnVbOiapyLpvZ6yjsgxSHeuHU/a0aIO21sTVpKnWYC
	w2IzDksZnJASsTEF39SYG/1JKzuQ0sOvGCe1fc669Dv/OO4PDecT/0itIXAOAZRuM5fwpeU9/Vg
	j8YHm4U2PLWhKsL/g08ORN6QsXqMnz2yxCF5HhiyMSNIhLRob1ra3E3fxTmnQg20JjXW68EkswJ
	mKarBUn25OcflkMojYSR+Bq5hjWsWPb5XT1LtCRG77reAH5JSXWun/xu36bcvlPI8mfqR+eu5u7
	S4dDhoR+iYnSzcN9hEe82OAEYy0
X-Gm-Gg: AZFdTZd+e1lWgJj9V5Xxn1/9JbTvsGU3hEYTomDsaBZM3k5klJlZzDlIR0AmcMpit/w
	iKPLdOqbKbdECJqlVbCk/Ou4R2vYulwn3LV5IDleUWQv56qZgOsap+MCe/4i9YN6Cp0CNejBjay
	JYrRJ/6sVUtVpp+CNBb5cof8fbZjmSmuIBJNdPSNpDgbIrT+Y3klIg2T4hsfO0eKNjhco6I3//7
	kabDtyR9Y9oSfw38DAu8zNAdjCE1Lbzofy4PHNrOLLNFTflfCYOZvvACZV0BZH0wYby7zzzovSn
	0ct/1+IKJ8L5ZK4ra5TnszcMSovO3FPvmciCocr1XBVW0pevM9YtW/NmjutIUez2X9PogvQjhfd
	/HymfyEhbKb8MtC6AilgDzVssXXviqsDpq7mAe259uWOemZw0qiH4cHJDZu9u+WRxRWLKr3ztaX
	Mr4BdIOtfBxkygl3+KRDpPRJpVhGBkVyJVFuoqhHIg8w==
X-Received: by 2002:a17:90b:4ac5:b0:3ab:c80:936f with SMTP id 98e67ed59e1d1-3b41c8e16e3mr17450940a91.16.1795703396848;
        Thu, 26 Nov 2026 06:29:56 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ac84fd5sm15339756a91.2.2026.11.26.06.29.56
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:29:56 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55d994579f9so74985681cf.0
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 06:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795703396; x=1796308196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QXNKwdPJ04JREY+aWREtcoE55TXV8m+B7lstNxSiSJ0=;
        b=E3qSJN1NmFofxmW5lg0sxHhX2UuHUvyA3cjthfdoPhSM/ciFVHcCE+q4BDwi6SQysp
         TXCoASbE8Pk1h1QK2LJ6jjU3/oGXVXwPPJ3gAI5tAoqNASgPgOITTpmU5IuzmQPyc3fy
         Nf5aOEP0urwGvy4p1F1Utfu8Gs2WkZFoc++h0=
X-Forwarded-Encrypted: i=1; AL+hErFDx7DxTAivqDvztvANBEEkGS1iFJcfbeVHIdI9LurG+S6p6a+CS2pbERg+wydeJai5/8VRJs/5CfybC2pzPA==@vger.kernel.org
X-Received: by 2002:ac8:5754:0:b0:535:1f5c:e489 with SMTP id d75a77b69052e-55d7690bde7mr66784121cf.5.1795703395499;
        Thu, 26 Nov 2026 06:29:55 -0800 (PST)
X-Received: by 2002:ac8:5754:0:b0:535:1f5c:e489 with SMTP id d75a77b69052e-55d7690bde7mr66783611cf.5.1795703394993;
        Thu, 26 Nov 2026 06:29:54 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm181098511cf.17.2026.11.26.06.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:54 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	michael.reeves077@gmail.com,
	marcan@marcan.st,
	j@jannau.net,
	asahi@lists.linux.dev,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH v2 4/5] wifi: brcmfmac: msgbuf: send the flowring delete without waiting for tx status
Date: Thu, 26 Nov 2026 15:29:41 +0100
Message-ID: <20261126142942.881504-4-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111120748.23795-5-dev@deq.rocks>
References: <20261111120748.23795-5-dev@deq.rocks>
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

On Wed, 11 Nov 2026 13:07:47 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> The BCM4377 firmware returns the tx status of queued packets only when
> it gets the flowring delete request. brcmf_msgbuf_delete_flowring()
> waits up to 100 ms for them before it sends the request, so every
> disconnect logs a timeout, and the cleared counter goes below zero when
> the status arrives.
>
> The race the wait was added for in commit 0fa24196e425 ("wifi: brcmfmac:
> fix continuous 802.1x tx pending timeout error") is covered by
> RING_CLOSING since commit 09be7546a602 ("wifi: brcmfmac: fix scheduling
> while atomic issue when deleting flowring"), and late tx status still
> releases the packet. Send the delete right away and reset the counter
> when the ring is created.
>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>

The race handled by 09be7546a602 is the posting side. What 0fa24196e425 also states
is that the flowring must be deleted only after all tx status is back, otherwise
pend_8021x_cnt never drains and every connection is delayed by 950 ms. Dropping the
wait is only safe if the firmware returns the tx status of the queued packets on
flowring delete, before the delete response. That was only observed on the BCM4377.
Would be good if this can be confirmed for other chips as well otherwise (probably)
better to keep the wait for those.

[...]

> ---
>  .../broadcom/brcm80211/brcmfmac/msgbuf.c      | 23 ++++++++-----------
>  1 file changed, 10 insertions(+), 13 deletions(-)

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
> @@ -73,7 +73,6 @@
>  #define BRCMF_MSGBUF_TRICKLE_TXWORKER_THRS	32
>  #define BRCMF_MSGBUF_UPDATE_RX_PTR_THRS		48
>
> -#define BRCMF_MAX_TXSTATUS_WAIT_RETRIES		10
>
>  struct msgbuf_common_hdr {
>  	u8				msgtype;

This leaves two consecutive blank lines before struct msgbuf_common_hdr.

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
> @@ -1471,23 +1475,16 @@ void brcmf_msgbuf_delete_flowring(struct brcmf_pub *drvr, u16 flowid)
>  	void *ret_ptr;
>  	u8 ifidx;
>  	int err;
> -	int retry = BRCMF_MAX_TXSTATUS_WAIT_RETRIES;
>
> -	/* make sure it is not in txflow */
> +	/*
> +	 * Make sure txflow posts nothing more to the ring. The firmware returns
> +	 * the tx status of the posted packets when it deletes the ring, before
> +	 * it sends the delete response.
> +	 */
>  	brcmf_commonring_lock(commonring_del);
>  	flow->rings[flowid]->status = RING_CLOSING;
>  	brcmf_commonring_unlock(commonring_del);
>
> -	/* wait for commonring txflow finished */
> -	while (retry && atomic_read(&commonring_del->outstanding_tx)) {
> -		usleep_range(5000, 10000);
> -		retry--;
> -	}
> -	if (!retry) {
> -		brcmf_err("timed out waiting for txstatus\n");
> -		atomic_set(&commonring_del->outstanding_tx, 0);
> -	}
> -
>  	/* no need to submit if firmware can not be reached */
>  	if (drvr->bus_if->state != BRCMF_BUS_UP) {
>  		brcmf_dbg(MSGBUF, "bus down, flowring will be removed\n");

As said above, I do not think the wait can go for all chips on the evidence of the
BCM4377 only. I will see if I can replicate this on my 43664 device.

Regards,
Arend
