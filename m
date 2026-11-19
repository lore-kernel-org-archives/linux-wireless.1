Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.255.225.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795067237;
	b=o+v6Q9jSU+fqOR6GJdA+0eqS170GJKGRE1QtbYfPiBbxPVnxrn4fOtnIhJiQ7dzfPTsL
	 u57idYSPRZISoI468lngMRQ66Jusgugkmj5mEz34KInt5PruHoCRlXX6Wn4uS/h9uNmc8
	 XnYRz/g0/HJJZ/zAWW/08S3ZNIM5dD9gR4qqHn9BGjC36E+bRJ12EY8MTvWFju8N4v6Iq
	 ezo+Q0le08y6+pRSzarlA80vWy9NvQAwNgdcO6o8aObQcj4aQC57gif+d2S1qE5kBh2vC
	 x8A5nSL9Z16JAMbclNnzftDjuZkw3aP3D60J0OVdCoNj8Pv7m+JZlNGu44Vt7O6PjXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067237;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ThreatScanner-Verdict:X-IPAS-Result:IronPort-PHdr:
	 IronPort-Data:IronPort-HdrOrdr:X-Talos-CUID:X-Talos-MUID:
	 X-IronPort-Anti-Spam-Filtered:X-IronPort-AV:Received:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=LiBMw5HGKxZfOnr6A1gk93zCfinpij3JgiY0tcabw5Y=;
	b=gLpXS2Ixs704n4KZxENQ0F0oZToH75YVm2CqKUczdGezhXOAz3483/076yrggBlhL2TP
	 3RG1iItPsHm2A07O9JBTocfJqCPiZULxJCSViQXdc4ZK6mUT+iytDvIqjnlWsANPUcsgL
	 KiG+80wu/3GAjZBFboijmgT/SNi4gJTCyOHD1QkGCmcIZOG1+/SCymhpmN8v7njNDiaqj
	 5LFdts8ZNq5T7XXIy5rJ83MUbqpCwvqncpRA7FurEVJf+WL7uDZdZ6UqmLWle1/ePo+ha
	 0AKa8I/leZI5SjBIeR2Tz1OVBntuwcTcA4Xo0txGxf62+SwrV9W2pWPl+UEmTt9Syuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=pobox.sk;
	spf=pass smtp.mailfrom=pobox.sk;
	dkim=pass header.d=pobox.sk header.i=@pobox.sk header.a=rsa-sha256 header.s=mail header.b=l1taC8Nk;
	arc=none smtp.remote-ip=46.255.225.202
Received: from gmmr-1.centrum.cz (gmmr-1.centrum.cz [46.255.225.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F79E606A325;
	Thu, 19 Nov 2026 05:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F79E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pobox.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pobox.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=pobox.sk header.i=@pobox.sk header.a=rsa-sha256 header.s=mail header.b=l1taC8Nk
Received: from gmmr-1.centrum.cz (localhost [127.0.0.1])
	by gmmr-1.centrum.cz (Postfix) with ESMTP id 11C3023C65;
	Thu, 19 Nov 2026 06:47:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.sk; s=mail;
	t=1795067229; bh=LiBMw5HGKxZfOnr6A1gk93zCfinpij3JgiY0tcabw5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l1taC8NkxsLQ8o4dK5hGkP1NzxChuCsqfgUInBHM/Yd3d1EGdtFmkhek6TZ+NR+cW
	 gJksBHCGXxmILrUw6EkZ6/KQthrER5UHXNxo0LL4vVVO07t6iY4FXPD10LgyLu8tYi
	 pjBXAUZ7qysEQDOazpbpQKegcmlTVYQA6tKLtpz4=
Received: from antispam67.centrum.cz (antispam67.cent [10.30.208.67])
	by gmmr-1.centrum.cz (Postfix) with ESMTP id 0F9DC2AF9C;
	Thu, 19 Nov 2026 06:47:09 +0100 (CET)
X-CSE-ConnectionGUID: S18Jgbo2RNmsU1ONEdV3Mg==
X-CSE-MsgGUID: VI5laHKIRUydkmOrxSgx7w==
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2F6BADxjP5q/03h/y5aHgEBCxIMSYE8CwKDSoFsli8dA?=
 =?us-ascii?q?4V6jHeLOIF+DwEBAQEBAQEBAQlEDQQBAQMEOIFTgnMCjiInNgcOAQIEAwIDA?=
 =?us-ascii?q?QEBAQEBAQEBAQELAQEGAQEBAQEBBgYBAoEdhglGDUkBiUgBggcBgSSBJgEBA?=
 =?us-ascii?q?QEBAQEBAQEBAR0CDX4BBTIBRhALDQsuEEYGExuCaII5AQM3FAa6FoE0GgJl3?=
 =?us-ascii?q?H8WgTSBbgYVgTiIYgGFeRuEYoILRIRBPoIfiGoEgiKBDJA8iApSeBwDWSwBS?=
 =?us-ascii?q?wo1DDNyQwOBKUsFN2USPzsoHjkCOAYFEiARGUBDW0ROgQNdcDsoXQECHycfL?=
 =?us-ascii?q?RWBdgKCUYEjB1YCAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNUUmPxUYTwwLG?=
 =?us-ascii?q?gUaRwgCCwIMdCgREBMdHiQvBRomPhsKgQwnHx4bDgJ7PTcVGQSVBIJ4IYEpC?=
 =?us-ascii?q?AhQBzojERnHVAeEJIR1hy+WGoE3gjqNFIZpA5JumQiMEIF6mzuBbwWCCk2DW?=
 =?us-ascii?q?hNAGY46GYhzxwt4AgE8BwIHDwKHKop9gUwBAQ?=
IronPort-PHdr: A9a23:PEFlLRSn2/9jayrB6H/4vrm+xtpsos6ZAWYlg6HPa5pwe6iut67vI
 FbYra00ygOSAsODsrkY0LaH++C4ACpcusjH6CpDOLV3FDY7yuwu1zQ6B8CEDUCpZNXLVAcdW
 OlkahpO0kr/D3JoHt3jbUbZuHy44G1aMBz+MQ1oOra9QdaK3Iy42O+o5pLcfRhDiiajbrNuN
 hW2qhjautULjYd4Jas8xBnErmFUd+hLym9lKlyekhn468yt+JJv7zlct+gu+sNOUKj2Zbg0Q
 aJdAD87L207+crnuAXMQgeI+nYSSHgdnABSAwjC4hH6X5PxvTX/u+FgxiSUPtD4QK4tVzi64
 KllUBDnhD4ZOjA27W/bksN/gr5VrxKnvBx/3pXbYJqJO/pkf6PSZs0VSGxcVctMTSNBA4e8b
 4wSD+odOOtTsofwq0cSoRa4GAKhH/3kxCNWiXDq3K06y+UhHh/A3Aw8BNIFrXDYoMzoOKsOT
 ey5ya/FxijBYfxLwzfw8IbGfBA/r/ySQLx+csTRxkYzGAzYgVufq5foPy+W2+kXr2SX8/ZsW
 f+phmU6qw9xuD+vxsI0h4fXgYIVz0rL9T5ky4grIt24Tk57bsS5EJtLqS6aLZZ9T8Q+Q21yp
 CY6zbsGuZ6hcygX05Qo2QTfZuefc4iP+R3jU+mQLS1jhHJmYb+ygQu5/ke8xOPmTMa0zEpKo
 TRfktnKrn0AyRPe58qbRvdj4kqtxzWC2QDP5+xFL005iaTWJZ4gz7M0kpces1rOEyzqlEjyg
 qGaaksp9va15+n6YLjruoGQOolpgQ/wNaQun9awAeU+MgUWXGiU5/681Lv98k39WrlKiec2k
 qbfvZvHJsobvra0DgBU34o59RqyDzer3M4GkXUZLF9JYhCKgorxN13TI/31Du2zj0mtnTpp3
 fzKI7PsD5fXInTekLrsebBw4FNGxgUp19BQ/ZdUB6kEIPL0R0D+qsTVDgQ8Mwyo2+bnD8h91
 p8GVWKPHKCZNKTSvEeH5uIqOuWMf4oVuCrlK/Q4+/Lil2M2lkEbfam1x5sXdXW4Eu56LESYe
 Xbsg9EBHnkWvgcmQ+HniUeOXSBTanuyRa4w+C83BYK8AYrBRI2hmLmB0z26Hp1SaGBGEFeME
 XLweoWYQfsMdCWSIslhkjMeSLihUJEu1Qu1uQ/izLpoNe3U+yICuZL419h5//fTmg0q9TxoE
 8Sd1HmAT2dvkWwVXDI22rtwrlFnxleFy6d4huJXGcRJ5/xVSgc6KYLcz+tiBtDuXQLBfcmGR
 U26QtWhAjE+UMg9zMINY0plAdWtkgjD3za2A78Sj7GLAJ008qTB33n+Psp9yGjJ1LMnj1Y4R
 stCLnOmhqFh+AjJHYLJkFuWl7ysdasC2C7B7mCDzXCBvE1ASg5/Tb3FXWwDZkvRtdn54kLCT
 7mzCbUoKwdAx8+CKrFUZd3tk1pGX+zjNc/AY2K+hWiwHwyExrCSY4rwfWUSwiHdBFIDkwAJ8
 naKLQ4+CTy5rGLEEDNuDU7vY1/r8eRmp363VlI7zwKLb01kz7e74hEbivKCRf0Pwr8Kvj8tp
 ChxHFmnxdLZF8KNqRJ4cqtEbt0x+ExH1XrXtwFlJpKuNrhsiFFNOzhw6n/p1Bg/Ki6QkMwjq
 n9v7qGiM62V1khMcXvMwZfzN5XLLWr/uhysPf34wFbbheqR/64UoMg/rVXqoRqkDAJ27zN71
 N9V2maH64/iFA0YVoK3SUVhpEsynK3TfiRov9Cc7nZrK6Th92aag7oU
IronPort-Data: A9a23:MagRyKBnWWWUCBVW/y7iw5YqxClBgxIJ4kV8jS/XYbTApD0l3jYPn
 GROWT+Oa6rcMDagKNtyPoXi8k9VuJfWnNBkOVdlrnsFo1CmCCbm6XZ1Cm+qYkt+++WaFBoPA
 /02M4eGdIZoCCeF+H9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7dRbrVA357jXGthh
 fuo+5eBYQb8i2YvWo4pw/vrRC1H7amaVAww4QRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuuuTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vR3Sxowsl
 48d3XCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfOjge1
 /MSL2o3SBWYuruR5p+3dLJJiZF2RCXrFNt3VnBIwjScFvM6WcmbBa7H48NCwTJ2jdIm8fT2O
 5RfM2cyKk6aPlsQZT/7C7pn9AusrmW5bzpeqFuIvqcty3DUxgthlqPuWDbQUoXUH5oMzx7J+
 woq+UzHI0wePfy86AC4436vg8jVjRj0SN0NQejQGvlCxQf7KnYoIBscWXO9q/X/jEe7Vrp3N
 0sX9wIyqqs/skCoJvH5XhulsDuHswQaVt54DeI38keOx7DS7gLfAXILJhZFado7pIopRCYn0
 lKShPv3CjF19r6YU3SQ8vGTtzzaBMQOBTNcI3VZEE1fuYSl/95bYg/zc+uP2ZWd1rXdcQwcC
 RjRxMTir93/VfI26pg=
IronPort-HdrOrdr: A9a23:KGCZDa6LDLzasIy34APXwMXXdLJyesId70hD6qm+c3Nom+ij5q
 WTdZMgpHvJYVcqKRMdcL+7UpVoLUmwyXcx2/h3AV7AZniEhILLFuBfBOLZqlWKJ8S9zI5gPM
 xbHZSWZuedMWRH
X-Talos-CUID: 9a23:Qkt1WGDSn330aXX6ExI+pGwbEMd/SFvY10qJBGmVBVgybbLAHA==
X-Talos-MUID: 9a23:GfiZ2wUCCer/Orfq/AHN2TVrFORJ2Zm/BEMIto8WgMaUajMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787004000"; 
   d="scan'208";a="162719095"
Received: from unknown (HELO gm-smtp10.centrum.cz) ([46.255.225.77])
  by antispam67.centrum.cz with ESMTP; 19 Nov 2026 06:47:08 +0100
Received: from blackbox (188-167-137-159.dynamic.chello.sk [188.167.137.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gm-smtp10.centrum.cz (Postfix) with ESMTPSA id 999C0809990F;
	Thu, 19 Nov 2026 06:47:08 +0100 (CET)
Date: Thu, 19 Nov 2026 06:46:55 +0100
From: Tomas Tonhauser <t.tonhauser@pobox.sk>
To: Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] wifi: ath9k: fix loss of non-aggregate frames
Message-ID: <av6NT4zjbfMuk7Lf@blackbox>
References: <20261028171652.1125692-1-t.tonhauser@pobox.sk>
 <87ik1vu8m1.fsf@toke.dk>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ik1vu8m1.fsf@toke.dk>

On Tue, Nov 17, 2026 at 10:09:58AM +0100, Toke Høiland-Jørgensen wrote:
> 
> So an alternative solution to what appears to be the same problem your
> patch 1 is solving appeared:
> 
> https://lore.kernel.org/r/20261110170459.31857-1-dominikengelhardt@ymail.com
> 
> Could you please check if this approach works in your tests (with or
> without patch 2)?
> 
> Thanks!
> 
> -Toke

Yes, it works. I tested Dominik's patch instead of patch 1 on the same
AP (EAP225 v3, QCA9563, OpenWrt 25.12.5), with patch 2 switched on and
off at runtime by a test-only module parameter, alternating runs.

With Dominik's patch every filtered frame now reaches mac80211
(tx_filtered matches "TXERR Filtered") and the mac80211 retry gets it
through:

  Strong client (-50 dBm), 3x500 pings at 50 ms + 3x25 at 1 s:
    Dominik only:       0 lost, 105 filtered, 103 via tx_filtered
    Dominik + patch 2:  0 lost, 111 filtered, retried in ath9k

  Weak client (-75 dBm), 4x500 pings at 50 ms (1000 bytes),
  3x500 at 50 ms (56 bytes), 3x25 at 1 s (1000 bytes):
    Dominik only:       4 lost, all of them XRETRY
    Dominik + patch 2:  0 lost

So Dominik's patch makes patch 1 unnecessary, and it keeps powersave
filtering intact. I'll drop patch 1.

Patch 2 still helps with frames that exhaust the hardware retry chain.
The link was good during these runs (3 XRETRY in 2000 frames), but in
an earlier evening test on the same client it was 130/3000 without the
software retry and 1/3000 with it.

Dominik's explanation also matches what I see. The strong client got a
filtered frame every 1-2.5 s with no XRETRY at all, largely
independent of the traffic rate, and both test clients share their
block of eight key cache indices with ESP8266 clients that toggle
powersave constantly. That answers my open question from the RFC.

I think best would be to have my patch 2 on top of Dominik's patch (I
can post it now with a dependency note or wait until Dominik's patch
is applied).

Thanks,
Tomas

