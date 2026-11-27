Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795774397;
	b=fCv/a/1qbO4JI+rLMf5iLO1j6DJZCvqawf0Mix2XnZ7DgNBjBFdyBvUC5dts8UzoCU5n
	 5S0804OVm94SuCv6rmmD3G+ArPcyaEV7YAVfz0iy9emklXPDL2Pvl/7l89w7Q2RVaUwRm
	 SP9ZlbZY9ekTfuml/Ahe5RX/SYL0te++Q5g4CS1k72sIZA/LKgO64JBVvK97OAciXyYoq
	 afRN+z/ioZQJi8SRy2hZBuuKokfW5gRJutouTvNZU/XQItruT+/OV6+LvxhvmMvJwAACx
	 a72ZVo+6l2AeV9C1gQS+lm57aH+hOIpbqxXjRnvW8VlH4sSAqq0AoI4U9ohgSCPTK3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774397;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=4g05Eg8/8DBF5Yv5mhJiXdrpwU99lSRQcS2V0UclwxI=;
	b=k+kgFf0dL6nKuvfziX9osrPQurWZq9FYNMKEaoK8/vRV1gQlnKjY7iP1S9c9WemmWuCF
	 zUoZSbr3t/Xe+UgKrWhD82yoLCM0kPacZq9r6fbKE7j70RckL3NcrQ51sp+3aL9P7MoF2
	 N51KeVobhPdRqqp4Ki5PhUP5gGKhxhg4HdrF4IhF3udhaf702yTdT310WA0srD6wuChLE
	 GRajElrecJR+3hAS9SWKiT+bo7TZO4n68fIolFrgzvv/uDc3rrMKLAB03h+te2HA2w11Y
	 L3cbs4oGfWgI2VbtMbaOXFWkjbLKxOTks2udt5xcpgS5mnGbYYoLEse2KOw0oGii/xg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=42vCCxK3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.55
Received: from sender5-of-o55.zoho.com (sender5-of-o55.zoho.com [165.173.182.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF7B606A31C;
	Fri, 27 Nov 2026 10:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDF7B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=42vCCxK3
ARC-Seal: i=1; a=rsa-sha256; t=1795774380; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZYAng+MbJDIG/52rMyeVJlPWub65ehNcAlvHHTliWoeuyXMPsb2ydwTgYbiaGFC/zRZ9pbULi0lGVWfB9ba0BGwZNu9WfAtfEQrtsv01L+UWUZXu5SDBFeJQFf3Ov0JEg4XonIKQPwqBAuSdevS8HbBF7YNiri09nloqXPiHx6E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795774380; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4g05Eg8/8DBF5Yv5mhJiXdrpwU99lSRQcS2V0UclwxI=; 
	b=EdzbhJmqG3ondcdys9Kw0zNYKJPN0O5L6J/aGAXHUlCV/FGSL2T/4wb4igwpIX7fxqwWz44F2TKE0xijWXcWiU2Mgw3kcXQN/1BlzCIl/C8QwBRiWJKV5GxZKgQXMRmQx2P8O5XySkZmYhcxv1mBvUcseYXtkWybtDJBynZA7KA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=42vCCxK3xhOLaXZQ+8S+RAm+A6BY/ruqoP/KXZe/QzbG+/K2KI7MmDag1So0tTA2wiEB2qBhLdnPdgyKFX2yi24T0AwuLPGMeWnFdm0B0gX2ZLi7MVuMES3qGZz9oKL23hbQDHFz/kk4+wL+uBF3YC0tIBYfzFkqz7SAAVnxKhJrJ930qyXMFQjh0ByRCrxf0FdzXzhTyGPw84XbJec9fMuIaTpZO2qoNuoG/EFZVf9RRubMLCjLoo9eV0MXwb65vRo+i6O8n+za5AbCGROi9jEeF8WW0iOSR4f117PjEJ+hhLkp4iDsHRPdWT23YIdhBUydiDeAlxz74QOk9J0WjQ==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=4g05Eg8/8DBF5Yv5mhJiXdrpwU99lSRQcS2V0UclwxI=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795774377754223.66927596052744;
	Fri, 27 Nov 2026 02:12:57 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Enver Ikromov <owner@ph4ntom-rev.uz>,
	linux-wireless@vger.kernel.org,
	Ahmet Zeren <niko3x@proton.me>,
	Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rtw-next 1/2] wifi: rtw89: fix retry limit and NO_ACK status for injected frames
Date: Fri, 27 Nov 2026 15:12:51 +0500
Message-ID: <20261127101251.1850-1-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <06298e2d51ca45e482165b9c7bdbfdf3@realtek.com>
References: <20261126083141.1470-1-owner@ph4ntom-rev.uz> <20261126083141.1470-2-owner@ph4ntom-rev.uz> <06298e2d51ca45e482165b9c7bdbfdf3@realtek.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On Fri, Nov 27, 2026 at 07:27:12AM +0000, Ping-Ke Shih wrote:
> > Commit 92608bb5f14f ("wifi: rtw89: honor ASSIGN_SEQ, retries, and
> > NO_ACK for injected frames") has three issues:
>
> Your Fixes tag has said this.
[...]
> > 3. rtw89_tx_rpt_tx_status() sets IEEE80211_TX_STAT_NOACK_TRANSMITTED
> >    unconditionally for NO_ACK frames (including RTW89_TX_MACID_DROP and
> >    RTW89_TX_LIFE_TIME)
>
> I don't know why there is a problem?

In mac80211 (status.c), IEEE80211_TX_STAT_NOACK_TRANSMITTED sets
noack_success = true, so a dropped skb gets counted in
dot11TransmittedFrameCount (and skips retry_failed / lost_packet when
sta is present) even though it was never sent.

[...]
> Generated by LLM? Can you reword commit message yourself?

Yes, sorry for the noise. English isn't my first language so I used an
LLM to polish the commit log and it came out way too verbose. I'll
rewrite it plainly myself in v2 and drop the redundant Fixes sentence.

> No need parenthesis for ( & )
[...]
> You need to consider min of driver and ieee80211, so maybe
>     min(0x3f, IEEE80211_MAX_TX_RETRY)
>
> The logic is clearer.
[...]
> Why do you need to clear these two bits ahead?
[...]
> I think the original ~IEEE80211_TX_STAT_ACK is not necessary.

Agreed on all of these. The TX_STAT_* bits are already zero on a fresh
skb, and min(RTW89_TX_DATA_CNT_LMT_MAX, IEEE80211_MAX_TX_RETRY) is much
clearer. Will update in v2.

Thanks,
Enver
