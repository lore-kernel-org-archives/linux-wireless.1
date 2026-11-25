Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795570118;
	b=cWw2M8dZZx6GLUG94nZNoDwLdJiu1NnmcMMNxwhY3OsFMYoQPqgv+yN6uxuRtYKdu3Li
	 c6oxJBFTiMXBmjwmDugFa514MgXUUemu666MBP0f28EXoUNXzLQ6AeyhCDRzQdUpandX9
	 T/w+bPXFeXClCkqhZMJG59sAdzizf8pFaXHg3DlsWWXrosCve0FgY91gcvZicGdobVFS9
	 fWgdt4P1iEti6JMnuQ4c4mTjq8TtlGc9GlvIYimqlUzN8HQejNHIQ73kwI+oz401QXIhT
	 NRQAl8PtHi2NtTHfA/evAIltEpAGhNJanm/4PlOawmUAGsq6VLLXfPGX1C9i/ZWyL1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570118;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=g38NS2tn5bzijWNoYQJMRKGYeSXZqe81uw8xtM3+/X8=;
	b=3Y4S/yT+Px5k+1MxJ6oa8sPXlKaXwalfFmJp+QlVY899g5HMz1iMeW1ObUQLMpJFisd0
	 M3lPQ1F5rVzwF8zWTIrB8Ch4nOrDHsQ+q7EtAtAHttrPZtVf0S9XK+oKDO3kJkp2tCQxS
	 OOqEQuD5OCJOGLQZKuCHXVHgqdi+299llxetOAexnchb709qrquvWCxYLyVvowqrTDPAo
	 z/ezWbxTwk2y121Qf1IqR8ynIQ/Lg3fCxI0VYEtJBSN1gL3UX6pImr4GRF203iHjJ0uZ3
	 mwJj1qLeyXm0pnmLOHMljfZqEDSGlTZykiQzhDfu9cyjbxOOkLK8pE+luKgbm8TH/iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Z2gQC/Cp";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD1C606A327;
	Wed, 25 Nov 2026 01:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z2gQC/Cp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158A21F000EF;
	Wed, 25 Nov 2026 01:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795570118;
	bh=g38NS2tn5bzijWNoYQJMRKGYeSXZqe81uw8xtM3+/X8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Z2gQC/Cp+Ou5Py4Se8Q/mXBPUPlvxebFINdaRKG1h7/9ZV9TwGDYJTyaOcXy10bFu
	 aw+DHOasQR+pIb1PHFad4Ym31yoKNBTzdY4V1RjU1BGg20AdPhZuRnNit+C3wtWzRN
	 8aNnMr0YCH8Viec5bljXmXAHwtF+x/jbdlS++IRHvLPAIeV/xD2j6wJKZkTEsKTo+8
	 SG085vE18HBIlBsO5IizzEQjKycbJCTebRkCnYec/nZf7JG5IG4y9Y/ITVSLdnmR1P
	 s0nUkJdF2pqybOAdgIoe9bqaEAMswAD7bHL1yRSiq8p6Ex2DVqEHBWoCGWc462BDYM
	 pIK5NoR3uskdQ==
Subject: Re: [PATCH wireless 1/2] wifi: mac80211: do not copy the mesh RSN IE
 twice into the beacon
From: netdev-bot+sashiko@kernel.org
To: piyus@iiitd.ac.in
Cc: johannes@sipsolutions.net, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kapil@presceralabs.ai,
 kuba@kernel.org
Date: Wed, 25 Nov 2026 01:28:37 +0000
Message-ID: <179557011763.3135.4931211502666684623@kernel.org>
In-Reply-To: <20261124003526.78471-2-piyus@iiitd.ac.in>
References: <20261124003526.78471-2-piyus@iiitd.ac.in>
X-sashiko-severity: Critical
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 1 · High: 0 · Medium: 0 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Critical] This patch adds a new out-of-bounds write into the mesh
  beacon buffer.
- [Low] The commit message names the wrong netlink attribute as the
  trigger: "One NL80211_CMD_JOIN_MESH carrying such an NL80211_ATTR_IE…
- [Low] Changing mesh_add_rsn_ie() also changes Mesh Peering Open/Confirm
  frames, which the commit message does not mention.

--

wifi: mac80211: do not copy the mesh RSN IE twice into the beacon

This commit limits the RSN IE search in mesh_add_rsn_ie() to the part of
the user's mesh IE blob that comes before the first vendor IE. That part
is found with ieee80211_ie_split_vendor(). The goal is for
mesh_add_rsn_ie() and mesh_add_vendor_ies() to cover disjoint ranges, so
their combined output fits the ifmsh->ie_len budget reserved in
ieee80211_mesh_build_beacon().

> One NL80211_CMD_JOIN_MESH carrying such an NL80211_ATTR_IE is enough.

[Severity: Low]
Is this the right attribute? nl80211_join_mesh() doesn't seem to read
NL80211_ATTR_IE. The blob that ends up in ifmsh->ie comes from
NL80211_MESH_SETUP_IE, which is nested inside NL80211_ATTR_MESH_SETUP:

net/wireless/nl80211.c:nl80211_parse_mesh_setup() {
    ...
	if (tb[NL80211_MESH_SETUP_IE]) {
		struct nlattr *ieattr =
			tb[NL80211_MESH_SETUP_IE];
		setup->ie = nla_data(ieattr);
		setup->ie_len = nla_len(ieattr);
	}
    ...
}

The attribute also matters for the analysis further down, because the
NL80211_MESH_SETUP_IE policy allows up to IEEE80211_MAX_DATA_LEN bytes.

> An RSN IE placed behind a vendor IE is still emitted, as part of that
> verbatim vendor range; nothing that a well-formed configuration sends is
> dropped.

[Severity: Low]
mesh_plink_frame_tx() in net/mac80211/mesh_plink.c also calls
mesh_add_rsn_ie(), so this patch changes Mesh Peering Open/Confirm frames
as well as beacons. Should the commit message say so?

In mesh_plink_frame_tx(), mesh_add_rsn_ie() runs right after the extended
supported rates. mesh_add_vendor_ies() runs at the end of the frame:

	    mesh_add_rsn_ie(sdata, skb) ||
    ...
	if (mesh_add_vendor_ies(sdata, skb))
		goto free;

Before this patch, an RSN IE placed behind a vendor IE appeared twice in
peering frames: once in its normal position and once in the trailing
vendor block. After this patch it appears only in the trailing vendor
block, after the Mesh ID, Mesh Config, MPM, HT, VHT, HE and EHT elements.
Beacons get the same reordering.

Could the commit message describe the peering frame change, and explain
why it is fine to move the RSN element out of the standard element order?

> diff --git a/net/mac80211/mesh.c b/net/mac80211/mesh.c
> index 8f88141253758..eb54bd98f282a 100644
> --- a/net/mac80211/mesh.c
> +++ b/net/mac80211/mesh.c
> @@ -379,12 +379,19 @@ int mesh_add_rsn_ie(struct ieee80211_sub_if_data *sdata, struct sk_buff *skb)
>  	struct ieee80211_if_mesh *ifmsh = &sdata->u.mesh;
>  	u8 len = 0;
>  	const u8 *data;
> +	size_t prefix;
>  
>  	if (!ifmsh->ie || !ifmsh->ie_len)
>  		return 0;
>  
> -	/* find RSN IE */
> -	data = cfg80211_find_ie(WLAN_EID_RSN, ifmsh->ie, ifmsh->ie_len);

[ ... ]

> +	prefix = ieee80211_ie_split_vendor(ifmsh->ie, ifmsh->ie_len, 0);
> +	data = cfg80211_find_ie(WLAN_EID_RSN, ifmsh->ie, prefix);

[Severity: Critical]
Can prefix end up larger than ifmsh->ie_len here?

The commit message relies on "the split returns an element boundary that
is not past ifmsh->ie_len". However, ieee80211_ie_split_vendor() moves
forward one whole element at a time:

	while (pos < ielen && ies[pos] != WLAN_EID_VENDOR_SPECIFIC)
		pos += 2 + ies[pos + 1];

So it returns pos > ielen whenever ielen ends in the middle of an element.

That can happen because ifmsh->ie_len is still a u8 in struct
ieee80211_if_mesh, while the policy allows NL80211_MESH_SETUP_IE up to
IEEE80211_MAX_DATA_LEN (2304) bytes:

	[NL80211_MESH_SETUP_IE] =
		NLA_POLICY_VALIDATE_FN(NLA_BINARY, validate_ie_attr,
				       IEEE80211_MAX_DATA_LEN),

copy_mesh_setup() in net/mac80211/cfg.c kmemdup()s the full blob, then
does:

	ifmsh->ie_len = setup->ie_len;

This truncates the length modulo 256. validate_ie_attr() checked element
framing only against the full nla_len, so the truncated length can fall
inside an element.

For example, take a 257 byte blob: an RSN element with a 253 byte body
(255 bytes in total), followed by a 2 byte non-vendor element. It passes
validate_ie_attr(), and ifmsh->ie_len becomes 1:

ieee80211_mesh_build_beacon()
    tail_len = ... + ifmsh->ie_len;               /* 1 byte budget */
    mesh_add_rsn_ie()
        prefix = ieee80211_ie_split_vendor(ie, 1, 0);   /* 255 */
        data = cfg80211_find_ie(WLAN_EID_RSN, ie, 255); /* offset 0 */
        skb_put_data(skb, data, 255);
    mesh_add_vendor_ies()                  /* nothing, 255 >= 1 */
    memcpy(bcn->tail, skb->data, bcn->tail_len);

The builder skb comes from __dev_alloc_skb(max(head_len, tail_len),
GFP_KERNEL). Rounding up to the kmalloc bucket gives it slack, so the
skb_tailroom() checks pass.

Wouldn't the final memcpy() into bcn->tail then overrun the
kzalloc(sizeof(*bcn) + head_len + tail_len) allocation? That is the same
place the KASAN report in the commit message points to.

Before this patch the search was bounded by ifmsh->ie_len, so it could not
return an RSN element that extends past the budget. The sender controls
the residue of the length modulo 256 and where the RSN element straddles
it, so the overrun can reach about 253 bytes.

The follow-up commit "wifi: mac80211: widen the mesh IE offsets a u8
cannot hold" doesn't appear to fix this. Its commit message says
"ifmsh->ie_len is a size_t", but the field is still a u8 at the end of
the series, and prefix is still not clamped.

Would prefix = min(prefix, ifmsh->ie_len) fix this? It would also need
either ifmsh->ie_len changed to a size_t, or NL80211_MESH_SETUP_IE capped
in the policy at what mac80211 can store.

>  	if (!data)
>  		return 0;
>

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124003526.78471-2-piyus%40iiitd.ac.in
