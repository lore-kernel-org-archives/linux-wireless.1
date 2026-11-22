Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378192;
	b=4TCzjIoQ0m/dIxd9FOiK8EzSYCGXNnYVDGF3SIxwCfUd79/CtqcF5V/RgOblzp5MQqV6
	 /rSSB/dUjdFubEvgwhRRFypx+zRG+so0O97mc291Tkk+Q5ZGFeOQ0UrxiONYDDj37wYge
	 dJqBYwbVQ0w/0ryCz/uA17dYWO/2FR4eQmGuwlmha3BIzD12hrO9Nz9vgMtSyyGIHmaX3
	 V6eHxHKYeVK0HMxpOzCj70vxWDrtllQP3n5xL8MZw8rWCCAK9Lr3bmW6vCP0SPRRbagpT
	 RLvyiCkvFAnOZxwWc/ReCZwf33rSluHEDfnmaCuwg2/9AgrWZ3eOYFNLiI0hqtYEkGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378192;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=znD4AFf8/IzQofgtA64x5aA+/MudrRRXANKmbKDYBVo=;
	b=Am86EmmJtbBKZxuXVrONkiodFSvIdO07m0QIIM0jCGFUoDgKa7jxSGNs70yaCRQGoJ6c
	 ux9hEs9QE80OAR1EgJQMJMqHPywzF2cwYcs2Tw+Eu5zIJJjOq01fKbfJh7D5/ASL6ejTl
	 KJxI/Eb+HEG/XkrXrFC8wQkNcQa5QSziR0l1BwVF3jaBWb3b5r3dCrlGunyBzuWNQa9JU
	 ocifegGbCx32TEXNGAwmTDay3dAyZhyWQkGedUJdkYSDaP3yoJwJtgf9ykJDdjvACUDZb
	 nUtTE4oSwTM3fdeuJTtFDtD8lNpVCmFu8jZpNlyH3SJUY8l9W8cBQsSirzW1QBz21bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HVhIuyUJ;
	arc=none smtp.remote-ip=74.125.82.228
Received: from mail-dy1-f228.google.com (mail-dy1-f228.google.com [74.125.82.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1353F606A334
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 20:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1353F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HVhIuyUJ
Received: by mail-dy1-f228.google.com with SMTP id 5a478bee46e88-38644aedba1so3640691eec.0
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 12:09:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378190; x=1795982990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=znD4AFf8/IzQofgtA64x5aA+/MudrRRXANKmbKDYBVo=;
        b=PegRw2f0114GcesuI9fbpwCy825TpOqMf0tcF6oeu9KpayN2PGK46AVl1MQ0Xwif3C
         DAr/ui9jSRMjieAgS0bvS+7go4DYUNqywxfRbVNazwkAPjQNUhGrX+V3BlMkLQNIobz6
         IwJiafLDXpcKCU0g+JxUrNvO32u56mI27MnYQIPVf1zkHKLYNvQWFmT5oe3HXrtgErI2
         r7LzJH6k6288KkXMxH87eAe7efZsSMn8Csbw3eF55+mbbuU4Y3bgpOVsSiJ7o0MzAWJg
         JrG9eCWlC0U+hNMGcvx9q7dIzF/qriiw/yvr+tdqD0jg4Cu+iZ/QUnQtPYcEa9Ky99xr
         +pDQ==
X-Forwarded-Encrypted: i=1; AL+hErEliSDmdjK8W0z7Z5uAEJSdhpd8s1wtCUz4fbAoFld/Dwug2U4WoOBCiFeaSaa/B26vqmCECthUKhE5kem7pA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8h+7iD+ACIzSNJOKvJ18hy3lvgW7tNNpOD/7P7ADxI/AUJlUeC
	qMYFy1dl2NlyoAKpm08N8deo7C5Ke7KO2TuPcVZ0qCVH7A+aBCbJdQNAHBFcZ7Eenq/049uPBsu
	w5fcDv36ST/wkI1SmTZmfXN8nnHbwY7FvQrjdgb1aSOZ0EJZE3NOgpkyiBFDBNvmDiTYgtvUFSq
	a0u/ivKyN8jmpFMVx3QzRyn6LglhbDDH1teK9SHOmUgHKUfh2j/NyXvN8UHP/TZ3Wy4/BZ3HLrl
	no2dg27YAKMXjNUrHb8DQGPnvto
X-Gm-Gg: AZFdTZdZKXQHES5qBSR7ZSMEcd6tnPSq4NXVJctH2rdCRMuQAWPHyhePyih8oe9cfoW
	6KvsNay7u2IkphJW71TT0RpwL3LrKwzJlMLoI/X8RhhdDSoYJQ3tMFv3VYVG65Fk3hJHtXHJUOV
	GrvzxQOp8OmQwge/67jT+uSqMhJv4dlvQow1y9XmH4sWccrh4QMkQOB7X7hpHAfyua99rbF6hOs
	RYAQFGCFbr3iypez0wbuiS+DwhW2W9uv9TvXvL8ipZ6Xw1J1gdCNF9Igp002KDOWKqYCFm8/AV7
	rI32ClR3MeChLiDIBteK9yLaN5pGnbfQ634jsyhFsCJx7XOlGmXSAihs5L3G8U7mWwE+k6adfXL
	FgMiRdPT6rHvN3UcvrcKXau4NM342T9pECvKLA0+3YiMLDECC220SvMvY1D1oYvCZvTchRY1jbG
	S9ZCQSkrtff04OHdi0T7aJ2LVgpzo4tt8pvnNyDy8=
X-Received: by 2002:a05:7301:2419:b0:367:185e:867a with SMTP id 5a478bee46e88-38571027a5dmr10774479eec.38.1795378189852;
        Sun, 22 Nov 2026 12:09:49 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-385677c0c07sm1098623eec.19.2026.11.22.12.09.49
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2026 12:09:49 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f26dd2165so706982285a.3
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 12:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795378188; x=1795982988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=znD4AFf8/IzQofgtA64x5aA+/MudrRRXANKmbKDYBVo=;
        b=HVhIuyUJwerUKXF8nZbBnPP6rrHrJclhwtEvEeT/9oX8wumXwWGnu9dSLXewHNOr3P
         cH1aGhScaxFw8kta4LUrRuIL2u2nLS9miFADSjOtWnwT59VMbqax666Ihdh5A+GR+J8P
         /xBkCGB6bctUSx+ymHlFg6wJBHzq5Gap1PSgY=
X-Forwarded-Encrypted: i=1; AL+hErFTiiIIO1lp/UXAdBz+zLbsShXJrX1xCVv1RmFSyqWlK8CfgSIWmZ957oYmuehDE5ZQ/AYISHRMOnpuml6zcQ==@vger.kernel.org
X-Received: by 2002:a05:620a:2945:b0:949:6574:f36a with SMTP id af79cd13be357-949ba9d02e8mr1628684085a.38.1795378188449;
        Sun, 22 Nov 2026 12:09:48 -0800 (PST)
X-Received: by 2002:a05:620a:2945:b0:949:6574:f36a with SMTP id af79cd13be357-949ba9d02e8mr1628681885a.38.1795378187987;
        Sun, 22 Nov 2026 12:09:47 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac11sm664845385a.14.2026.11.22.12.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:09:47 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH 7/7] wifi: brcmfmac: pass AWDL frames and role changes to user space
Date: Sun, 22 Nov 2026 21:09:31 +0100
Message-ID: <20261122200931.2090372-6-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151547.70333-8-dev@deq.rocks>
References: <20261104151547.70333-8-dev@deq.rocks>
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

On Wed, 4 Nov 2026 16:15:47 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> User space runs the AWDL election and peer discovery from the AWDL
> action frames other devices send. The firmware reports them with two
> events on the AWDL interface, ACTION_FRAME_RX and AWDL_EVENT (98). A
> header is in front of the frame. Its first 16 bits, high byte first,
> are its version: 1 is struct brcmf_rx_mgmt_data with 16 bytes, 2 has 24
> bytes. Both events come with either version. AWDL_EVENT carries a frame
> only with some of its status values. AWDL_ROLE (97) reports the AWDL
> role of the firmware in its status, 0 slave, 1 master not taking part
> in the election and 2 master.
>
> Register the two AWDL events when the firmware supports AWDL, so the
> event mask includes them. Pass every AWDL action frame (vendor specific
> category, OUI 00:17:f2, type 8) of the two events and the role changes
> to user space as the vendor events AWDL_FRAME and AWDL_ROLE. Other
> events of the AWDL interface are dropped as before.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/awdl.c        | 122 +++++++++++++++++-
>  .../broadcom/brcm80211/brcmfmac/awdl.h        |   4 +
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c    |   1 +
>  .../broadcom/brcm80211/brcmfmac/fweh.c        |   8 +-
>  .../broadcom/brcm80211/brcmfmac/fweh.h        |   5 +
>  .../broadcom/brcm80211/brcmfmac/vendor.c      |   8 ++
>  .../broadcom/brcm80211/brcmfmac/vendor.h      |  12 ++
>  7 files changed, 151 insertions(+), 9 deletions(-)

[...]

> @@ -324,11 +324,13 @@ static void brcmf_fweh_event_worker(struct work_struct *work)
>  			ifp = drvr->iflist[0];
>  		else
>  			ifp = drvr->iflist[emsg.bsscfgidx];
> -		/* The AWDL interface has no vif, its events are not for
> -		 * the cfg80211 handlers
> +		/* The AWDL interface has no vif, its events go to user
> +		 * space and not to the cfg80211 handlers
>  		 */
> -		if (ifp && ifp->awdl)
> +		if (ifp && ifp->awdl) {
> +			brcmf_awdl_fweh_event(ifp, &emsg, event->data);
>  			goto event_free;
> +		}
>
>  		err = brcmf_fweh_call_event_handler(drvr, ifp, event->code,
>  						    &emsg, event->data);

The return value of brcmf_awdl_fweh_event() is not used, and a
failure to allocate or fill the vendor event drops the frame without a
trace. A bphy_err() on those paths would show why frames are missing.

[...]

> @@ -94,7 +94,12 @@ struct brcmf_cfg80211_info;
>  	BRCMF_ENUM_DEF(FIFO_CREDIT_MAP, 74) \
>  	BRCMF_ENUM_DEF(ACTION_FRAME_RX, 75) \
>  	BRCMF_ENUM_DEF(TDLS_PEER_EVENT, 92) \
> +	BRCMF_ENUM_DEF(AWDL_AW, 96) \
> +	BRCMF_ENUM_DEF(AWDL_ROLE, 97) \
> +	BRCMF_ENUM_DEF(AWDL_EVENT, 98) \
>  	BRCMF_ENUM_DEF(BCMC_CREDIT_SUPPORT, 127) \
> +	BRCMF_ENUM_DEF(AWDL_STATS, 150) \
> +	BRCMF_ENUM_DEF(SDB_STATE, 152) \
>  	BRCMF_ABSTRACT_ENUM_DEF(EXT_AUTH_REQ, 0) \
>  	BRCMF_ABSTRACT_ENUM_DEF(EXT_AUTH_FRAME_RX, 1) \
>  	BRCMF_ABSTRACT_ENUM_DEF(MGMT_FRAME_TXSTATUS, 2) \

These event codes are specific to the firmware used for the Apple
chips, but BRCMF_ENUM_DEF puts them in the common list where the same
numbers may mean something else on other firmware families. Use
abstract codes for them and translate them in the WCC vendor module,
like cyw/core.c does for EXT_AUTH_REQ:

1. fweh.h: replace the five BRCMF_ENUM_DEF() entries by
   BRCMF_ABSTRACT_ENUM_DEF(AWDL_AW, 4), AWDL_ROLE 5, AWDL_EVENT 6,
   AWDL_STATS 7 and SDB_STATE 8, after the existing abstract entries.
2. wcc/core.c: define BRCMF_WCC_E_AWDL_AW (96), _AWDL_ROLE (97),
   _AWDL_EVENT (98), _AWDL_STATS (150) and _SDB_STATE (152) next to
   BRCMF_WCC_E_LAST, which already covers them, and add a
   struct brcmf_fweh_event_map brcmf_wcc_event_map with these five items
   and n_items = 5.
3. wcc/core.c: set fweh->event_map = &brcmf_wcc_event_map in
   brcmf_wcc_alloc_fweh_info().
4. Register the events from a new brcmf_wcc_register_event_handlers(),
   set as .register_event_handlers in brcmf_wcc_ops, instead of
   brcmf_awdl_register_events() called from wl_init_priv(). Keep the
   BRCMF_FEAT_AWDL check there, and export brcmf_awdl_fweh_event() for
   it. An abstract code is not range checked by brcmf_fweh_register()
   on a vendor without an event map, so it must not be registered from
   common code.

brcmf_awdl_fweh_event() itself keeps working, the event worker passes
it the abstract code.

Regards,
Arend
